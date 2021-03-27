#!/bin/bash
set -uexo pipefile
sudo apt update
sudo apt upgrade
sudo apt install \
    aptitude nano git tmux p7zip-full \
    valgrind cmake make clang-format-10 clang-tidy-10 \
    libboost-all-dev \
    g++-10 \
    clang-10
    libc++-10-dev libc++abi-10-dev
