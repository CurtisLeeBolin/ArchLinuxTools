#!/bin/bash

ionice --class idle du -sh "${@}"
ionice --class idle rm -rf "${@}"
