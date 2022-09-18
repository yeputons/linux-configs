#!/bin/bash
set -uexo pipefail
sudo apt update
sudo apt upgrade
sudo apt install \
    aptitude nano vim git tmux p7zip-full curl netcat-openbsd \
    valgrind cmake make cppcheck clang-format-14 clang-tidy-14 \
    libboost-all-dev \
    g++-12 \
    clang-14 \
    libc++-14-dev libc++abi-14-dev
