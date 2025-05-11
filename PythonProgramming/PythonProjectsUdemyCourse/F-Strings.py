def main():
    # --- Basic expression formatting ---
    def add(a, b):
        return a + b

    print(f"add(5, 10) = {add(5, 10)}")           # Outputs: add(5, 10) = 15
    print(f"add(5, 10) = { add(5, 10) }")         # Adds spacing around '='

    # --- Thousand separators ---
    big_num = 123456789
    print(f"{big_num:,}")                         # 123,456,789
    print(f"{big_num:_}")                         # 123_456_789

    # --- Underscore in numbers (ignored by Python) ---
    big_num_readable = 123_456_789
    print(big_num_readable)                       # 123456789

    # --- Float formatting ---
    fraction = 1234.56789
    print(f"{fraction:.2f}")                      # 1234.57
    print(f"{fraction:,.2f}")                     # 1,234.57 with comma
    print(f"{fraction:_>20.3f}")                  # Right aligned with underscores

    # --- Percent formatting ---
    percent = 0.5555
    print(f"{percent:.0%}")                       # 56%
    print(f"{percent:.2%}")                       # 55.55%
    print(f"{5555.55:.1%}")                       # 555555.0%

    # --- Text alignment ---
    name = "BOB"
    print(f"{name:10}hello")                      # Default left-aligned
    print(f"{name:>10}hello")                     # Right-aligned
    print(f"{name:<10}hello")                     # Left-aligned explicitly
    print(f"{name:^10}hello")                     # Center-aligned

    # --- Text fill characters ---
    print(f"{name:.>10}")                         # Right align with dots
    print(f"{name:#<10}")                         # Left align with hashes
    print(f"{name:@^10}")                         # Center align with @

    # --- Aligned numeric output ---
    numbers = [1, 10, 100, 1000, 10000]
    for n in numbers:
        print(f"{n:>5}_counting")

    # --- Raw strings (Windows paths) ---
    path = r"C:\Users\Username\Documents"
    print(path)

    # --- f-strings + raw strings (a.k.a. 'French strings') ---
    user = "siphenathi"
    full_path = fr"C:\Users\{user}\Documents\files"
    print(full_path)

if __name__ == "__main__":
    main()
