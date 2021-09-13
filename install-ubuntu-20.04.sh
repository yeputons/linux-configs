#!/bin/bash
set -uexo pipefail
sudo apt update
sudo apt upgrade
sudo apt install \
    aptitude nano vim git tmux p7zip-full \
    valgrind cmake make cppcheck clang-format-12 clang-tidy-12 \
    libboost-all-dev \
    g++-10 \
    clang-12 \
    libc++-12-dev libc++abi-12-dev
