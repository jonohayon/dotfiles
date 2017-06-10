#!/usr/bin/env bash

while [[ "$1" != "" ]]; do
  case $1 in
    -w | --with )
      shift
      echo "with $1"
      ;;
    -wo | --without )
      shift
      echo "without $1"
      ;;
  esac
  shift
done
