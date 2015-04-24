#!/bin/sh
set -eu

cd $CKAN_HOME/src/
for package in *
do
  if [ -d "$package" ]; then
    cd $package
    if [ -e "setup.py" ]; then
      echo "Installing $package"
      $CKAN_HOME/bin/pip install -e .

      if [ -f "requirements.txt" ]; then
          $CKAN_HOME/bin/pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple/
      elif [ -f "pip-requirements.txt" ]; then
          $CKAN_HOME/bin/pip install -r pip-requirements.txt -i http://mirrors.aliyun.com/pypi/simple/
      fi
    fi
    cd ..
  fi
done
