#!/bin/bash -eux

if [ -z "${upload_dir+x}" ]; then
  upload_dir="$1"
fi

if [ -z "${build_dir+x}" ]; then
  source "$(cd "$(dirname "$0")" && pwd)/../shared.sh"

  build_dir="build"

  if isLinux; then
    build_dir=obj/build
  fi

fi

# CPU usage statistics.
cp build/cpu-usage.csv "${upload_dir}/cpu-${CI_JOB_NAME}.csv"

if [ -f "${build_dir}/metrics.json" ]; then
  # Build metrics generated by x.py.
  cp "${build_dir}/metrics.json" "${upload_dir}/metrics-${CI_JOB_NAME}.json"
fi
