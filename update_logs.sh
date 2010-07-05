#!/bin/bash
mkdir new_logs
for i in `ls *.ulp`
do
	echo ================ $i ===================
	rm -f errr.txt 
	valgrind -q --error-exitcode=66 --leak-check=full ~/workspace/C++/bin/UnitexToolLogger RunLog $i -r /tmp/foo.ulp
	if [ "$?" -ne "0" ] ;
	then
		echo "Error detected by valgrind on log $i"
		exit 1
	fi
	mv /tmp/foo.ulp new_logs/$i
done

