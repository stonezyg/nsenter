#!/bin/sh

[ -f main.retry ] && ansible-playbook -i main.retry main.yml

> summary.csv
for i in results/* ; do 
  cat $i >> summary.csv
  echo ,,, >> summary.csv
  echo ,,, >> summary.csv
done
