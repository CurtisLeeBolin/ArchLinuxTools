#!/usr/bin/env python3
#
#  nrtc.py
#
#  Copyright 2023 Curtis Lee Bolin <CurtisLeeBolin@gmail.com>
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.
#
#

import datetime
import os
import re
import subprocess
import time


class NrtcCommon:
    # list of file extentions to find
    fileExtList = [
        '3g2', '3gp', 'asf', 'avi', 'divx', 'flv', 'm2ts', 'm4a', 'm4v', 'mj2',
        'mkv', 'mov', 'mp4', 'mpeg', 'mpg', 'mts', 'nuv', 'ogg', 'ogm', 'ogv',
        'rm', 'rmvb', 'ts', 'vob', 'webm', 'wmv']
    inputDir = '0in'
    outputDir = '0out'

    def __init__(self, workingDir, fileList):
        self.workingDir = workingDir
        self.fileList = fileList
        return None

    def run(self):
        self.mkIODirs(self.workingDir)
        for file in self.fileList:
            if os.path.isfile(file):
                fileName, fileExtension = os.path.splitext(file)
                if self.checkFileType(fileExtension):
                    self.transcode(
                        file, fileName)
        return None

    def checkFileType(self, fileExtension):
        fileExtension = fileExtension[1:].lower()
        result = False
        for ext in self.fileExtList:
            if (ext == fileExtension):
                result = True
                break
        return result

    def printOnSameLine(self, line):
        columns, lines = os.get_terminal_size()
        line = line.replace('\n', '')
        line = line[:columns]
        clear_line_string = ' ' * columns
        print(f'\r{clear_line_string}', end='')
        print(f'\r{line}', end='')

    def runSubprocess(self, command):
        with subprocess.Popen(
            command, stderr=subprocess.PIPE, universal_newlines=True
        ) as p:
            stderrList = ['']*100
            for line in p.stderr:
                self.printOnSameLine(line)
                del stderrList[0]
                stderrList.append(line)
            print()
            p.wait()
            return (p.returncode, stderrList)

    def writeErrorFile(self, errorFile, transcodeArgs, stderrList):
        with open(errorFile, 'w', encoding='utf-8') as f:
            stderr = ''.join(stderrList)
            f.write(f'{transcodeArgs}\n\n{stderr}')

    def mkIODirs(self, workingDir):
        for dir in [self.inputDir, self.outputDir]:
            if not os.path.exists(dir):
                os.mkdir(f'{workingDir}/{dir}', 0o0755)
        return None

    def transcode(self, file, fileName):
        inputFile = f'{self.inputDir}/{file}'
        outputFile = f'{self.outputDir}/{fileName}.mp4'
        outputFilePart = f'{outputFile}.part'
        errorFile = f'{outputFile}.error'
        os.rename(file, inputFile)

        print(f'{self.workingDir}/{file}')

        transcodeArgs = [
          'ffmpeg', '-i', inputFile, '-filter:v',
          'scale=w=\'max(1920,iw)\':h=\'min(1080,ih)\':force_original_aspect_ratio=decrease:force_divisible_by=8',
          '-c:v', 'libx265', '-c:a', 'aac', '-movflags', '+faststart',
          '-map_metadata', '-1', '-y', '-f', 'mp4',
          outputFilePart]
        returncode, stderrList = self.runSubprocess(transcodeArgs)
        if returncode == 0:
            os.rename(outputFilePart, outputFile)
        else:
            self.writeErrorFile(errorFile, transcodeArgs, stderrList)
        return None


def main():
    import argparse

    parser = argparse.ArgumentParser(
        prog='nrtc.py',
        description='NR Video TransCoder',
        epilog=(
            'Copyright 2023 Curtis Lee Bolin <CurtisLeeBolin@gmail.com>'))
    parser.add_argument(
        '-d', '--directory', dest='directory', help='A directory')
    parser.add_argument(
        '-f', '--filelist', dest='fileList', help=(
            'A comma separated list of files in the current directory'))
    args = parser.parse_args()

    if (args.fileList and args.directory):
        print(
            'Arguments -f (--filelist) and -d (--directory) can not be ',
            'used together')
        exit(1)
    elif (args.fileList):
        workingDir = os.getcwd()
        fileList = args.fileList.split(',')
    elif (args.directory):
        workingDir = args.directory
        fileList = os.listdir(workingDir)
        fileList.sort()
    else:
        workingDir = os.getcwd()
        fileList = os.listdir(workingDir)
        fileList.sort()

    tc = NrtcCommon(workingDir, fileList)
    tc.run()


if __name__ == '__main__':
    main()
