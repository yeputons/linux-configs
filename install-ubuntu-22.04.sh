#!/bin/bash
set -uexo pipefail
sudo apt update
sudo apt upgrade
sudo apt install \
    aptitude nano vim git tmux p7zip-full curl netcat-openbsd jq \
    valgrind cmake make cppcheck clang-format-15 clang-tidy-15 \
    libboost-all-dev \
    g++-12 \
    clang-15 \
    libc++-15-dev libc++abi-15-dev
