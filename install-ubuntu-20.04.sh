#!/bin/bash
set -uexo pipefail
sudo apt update
sudo apt upgrade
sudo apt install \
    aptitude nano vim git tmux p7zip-full \
    valgrind cmake make cppcheck clang-format-10 clang-tidy-10 \
    libboost-all-dev \
    g++-10 \
    clang-10 \
    libc++-10-dev libc++abi-10-dev
