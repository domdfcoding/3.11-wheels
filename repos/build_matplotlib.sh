#!/bin/bash
tmp_dir=$(mktemp -d -t build311-XXXXXX)
virtualenv "$tmp_dir" --python python3.11
source "$tmp_dir/bin/activate"
python3 -m pip install "setuptools<60" wheel
python3 -m pip install ../wheels/cython/Cython-3.0.0a10-cp311-cp311-linux_x86_64.whl
python3 -m pip install ../wheels/numpy/numpy-1.23.0-cp311-cp311-linux_x86_64.whl
# cd numpy
# git submodule update --init
# cd ..
python3 -m pip wheel matplotlib --no-build-isolation --no-deps -vv

rm -rf "$tmp_dir"
