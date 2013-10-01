#!/bin/bash
echo -e '\033[0;30m  Black         0;30m \033[00m'
echo -e '\033[0;31m  Red           0;31m \033[00m'
echo -e '\033[0;32m  Green         0;32m \033[00m'
echo -e '\033[0;34m  Blue          0;34m \033[00m'
echo -e '\033[0;36m  Cyan          0;36m \033[00m'
echo -e '\033[0;35m  Purple        0;35m \033[00m'
echo -e '\033[0;37m  Light Gray    0;37m \033[00m'
echo -e '\033[1;30m  Dark Gray     1;30m \033[00m'
echo -e '\033[1;31m  Light Red     1;31m \033[00m'
echo -e '\033[1;32m  Light Green   1;32m \033[00m'
echo -e '\033[1;33m  Yellow        1;33m \033[00m'
echo -e '\033[1;34m  Light Blue    1;34m \033[00m'
echo -e '\033[1;35m  Light Purple  1;35m \033[00m'
echo -e '\033[1;36m  Light Cyan    1;36m \033[00m'
echo -e '\033[1;37m  White         1;37m \033[00m'

for i in {0..255} ; do
  printf "\x1b[38;5;${i}mcolour${i}  "
done
echo ''
