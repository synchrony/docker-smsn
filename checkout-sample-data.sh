#!/bin/bash

HERE=$(pwd)
cd /mnt/smsn-data
mkdir -p vcs
cd vcs
git clone https://github.com/synchrony/data-universal
git clone https://github.com/synchrony/data-public
cd $HERE
