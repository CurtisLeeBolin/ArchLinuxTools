#!/usr/bin/env python3


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


def html_parser(html_data: str) -> str:
    parser = href_parser()
    parser.feed(html_data)
    for file_url in parser.href_list:
      #if not file_url.startswith('http'):
      #  file_url = f'{url}{file_url}'
      yield file_url


def main() -> None:
  html_data=''
  with open('html', encoding="utf-8") as f:
    html_data = f.read()
  #print(html_data)
  with open('URLs.txt', encoding="utf-8", mode='w') as f:
    for s in html_parser(html_data):
      f.write(f'{s}\n')


if __name__ == '__main__':
  main()
