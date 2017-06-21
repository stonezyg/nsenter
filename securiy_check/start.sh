#!/bin/sh

rm -f results/* main.retry

# Gen main Playbook.
cat include/prep.yml > main.yml
for i in modules/*/* ; do 
  echo `basename $i` ; 
done | sort | uniq | while read file ; do 
  if ! echo $file | grep -q '^[0-9a-zA-Z]\{2\}-'; then
	continue;
  fi
  name=`echo $file | sed 's/^[0-9a-zA-Z]\{2\}-//g'`
  echo "# -------------------- Check `echo $name | tr [a-z] [A-Z]` --------------------" >> main.yml
  echo "  - set_fact: " >> main.yml
  echo "      mod_file: $file " >> main.yml
  echo "      mod_name: $name " >> main.yml
  echo "  - include : include/module.yml" >> main.yml
  echo "" >> main.yml
done
cat include/post.yml >> main.yml

# Run main playbook with local hosts file
ansible-playbook -i my_hosts main.yml

> summary.csv
for i in results/* ; do 
  cat $i >> summary.csv
  echo ,,, >> summary.csv
  echo ,,, >> summary.csv
done

python csv2excel.py
