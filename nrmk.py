#!/usr/bin/env python3

def main():
  import argparse
  import os
  import subprocess

  parser = argparse.ArgumentParser(prog='nrmk')
  parser.add_argument('directory')
  args = parser.parse_args()

  os.makedirs(args.directory, exist_ok=True)
  os.chdir(args.directory)

  subprocess.run(['nano', 'urls'])

if __name__ == '__main__':
  main()
