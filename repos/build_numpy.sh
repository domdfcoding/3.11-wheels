#!/bin/bash
tmp_dir=$(mktemp -d -t build311-XXXXXX)
virtualenv "$tmp_dir" --python python3.11
source "$tmp_dir/bin/activate"
python3 -m pip install "setuptools<60" wheel
python3 -m pip install ../wheels/cython/Cython-3.0.0a10-cp311-cp311-linux_x86_64.whl
# cd numpy
# git submodule update --init
# cd ..
# python3 -m pip wheel ./numpy --no-build-isolation -vv
python3 -m pip wheel git+file:///home/domdf/Python/3.11-wheels/repos/numpy --no-build-isolation -vv

rm -rf "$tmp_dir"
