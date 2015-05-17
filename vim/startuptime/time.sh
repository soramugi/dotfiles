#!/bin/bash
vim -c 'qall!' --startuptime start
vim -c 'qall!' -X --startuptime not-x-start
vim -c 'qall!' -u ~/.vimrc --noplugin --startuptime not-plugin-start
tail *start
