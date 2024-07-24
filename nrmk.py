#!/usr/bin/env python3

def main():
  import argparse
  import os
  import subprocess

  parser = argparse.ArgumentParser(prog='nrmk')
  parser.add_argument('directory')
  args = parser.parse_args()

  os.makedirs(args.directory, exist_ok=True)

  subprocess.run(['nano', f'{args.directory}/urls'])

  with open("list", "a") as f:
    f.write(f'{args.directory}\n')

if __name__ == '__main__':
  main()
