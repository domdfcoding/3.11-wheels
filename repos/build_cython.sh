#!/bin/bash
tmp_dir=$(mktemp -d -t build311-XXXXXX)
virtualenv "$tmp_dir" --python python3.11
source "$tmp_dir/bin/activate"
python3 -m pip install setuptools wheel
python3 -m pip wheel ./cython --no-build-isolation

rm -rf "$tmp_dir"
