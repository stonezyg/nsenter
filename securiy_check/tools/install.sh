#!/bin/sh 

rpm -ivh python2-pip*rpm && pip install --upgrade pip-9*.whl lxml-3.7.3-cp27-cp27mu-manylinux1_x86_64.whl && pip install et_xmlfile-1.0.1.tar.gz jdcal-1.3.tar.gz openpyxl-2.4.5.tar.gz
