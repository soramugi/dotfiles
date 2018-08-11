#!/bin/bash

rm -rf /Volumes/WALKMAN/.Trashes/*
rsync --exclude='.' --exclude='*.mp4' --size-only -r --delete -v /Users/mugi/.marks/radio/ /Volumes/WALKMAN/MUSIC/\{no\ name\}/\{no\ album\ name\}/

diskutil unmount '/Volumes/WALKMAN'
