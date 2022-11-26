#!/usr/bin/env python3


from urllib.request import urlopen, Request, urlretrieve
from urllib.parse import unquote
from html.parser import HTMLParser


class href_parser(HTMLParser):

  def __init__(self, *, convert_charrefs=True):
    super().__init__(convert_charrefs=True)
    self.href_list = []

  def handle_starttag(self, tag, attrs):
    if tag == 'a':
      for name, value in attrs:
        if name == 'href':
          self.href_list.append(value)


def html_parser(url: str, extensions: tuple[str]) -> None:
  #print(f'{url=}')
  #print(f'{extensions=}')
  httprequest = Request(url)
  with urlopen(httprequest) as response:
    #print(f'{response.status=}')
    parser = href_parser()
    parser.feed(response.read().decode())
    for ext in extensions:
      url_list = [i for i in parser.href_list if ext in i]
      for file_url in url_list:
        if not file_url.startswith('http'):
          file_url = f'{url}{file_url}'
        filename = unquote(file_url.rsplit('/', 1)[-1])
        print(filename)
        urlretrieve(file_url, filename=filename)


def main() -> None:
  import argparse
  parser = argparse.ArgumentParser()
  parser.add_argument("url", type=str)
  parser.add_argument("extension", type=str)
  args = parser.parse_args()
  extensions = tuple(args.extension.split(','))
  html_parser(args.url, extensions)


if __name__ == '__main__':
  main()
