BEGIN TRAN
-- start a transaction so all changes can be undone after inspection

CREATE TABLE tblGeom
(
    GXY geometry,
    Description varchar(20),
    IDtblGeom int 
        CONSTRAINT PK_tblGeom PRIMARY KEY 
        IDENTITY(5,1)    -- identity seed starts at 5 for demonstration
);

INSERT INTO tblGeom
VALUES 
    (geometry::STGeomFromText('LINESTRING (1 1, 5 5)', 0), 'First line'),
    (geometry::STGeomFromText('LINESTRING (5 1, 1 4, 2 5, 5 1)', 0), 'Second line'),
    (geometry::STGeomFromText('MULTILINESTRING ((1 5, 2 6), (1 4, 2 5))', 0), 'Third line'),
    (geometry::STGeomFromText('POLYGON ((4 1, 6 3, 8 3, 6 1, 4 1))', 0), 'Polygon'),
    (geometry::STGeomFromText('POLYGON ((5 2, 7 2, 7 4, 5 4, 5 2))', 0), 'Second Polygon'),
    (geometry::STGeomFromText('CIRCULARSTRING (1 0, 0 1, -1 0, 0 -1, 1 0)', 0), 'Circle');

SELECT * FROM tblGeom;

-- use Filter() to find shapes intersecting a given polygon
SELECT *  
FROM tblGeom
WHERE GXY.Filter(geometry::Parse('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))')) = 1
UNION ALL
-- include the filter shape itself for reference
SELECT geometry::STGeomFromText('POLYGON((2 1, 1 4, 4 4, 4 1, 2 1))', 0), 'Filter', 0;

-- merge all geometries into one continuous shape
DECLARE @i geometry;
SELECT @i = geometry::UnionAggregate(GXY) 
FROM tblGeom;
SELECT @i AS CombinedShapes;

-- collect all geometries into a single geometry collection
DECLARE @j geometry;
SELECT @j = geometry::CollectionAggregate(GXY) 
FROM tblGeom;
SELECT @j AS GeometryCollection;

-- compute overall bounding box and convex hull of all shapes
SELECT geometry::EnvelopeAggregate(GXY) AS BoundingEnvelope
FROM tblGeom;

SELECT geometry::ConvexHullAggregate(GXY) AS ConvexHull;

ROLLBACK TRAN
-- undo all operations to leave the database unchanged
