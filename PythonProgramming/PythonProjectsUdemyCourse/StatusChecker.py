import requests
from requests.models import Response

def get_response(url: str) -> Response:
    return requests.get(url)

def show_response_info(response: Response) -> None:
    print("Status code:          ", response.status_code)
    print("OK?                    ", response.ok)
    print("Links:                 ", response.links)
    print("Encoding:              ", response.encoding)
    print("Redirect?              ", response.is_redirect)
    print("Permanent redirect?    ", response.is_permanent_redirect)

if __name__ == "__main__":
    website = "https://www.intently.io"
    response = get_response(website)
    show_response_info(response)
