#!/bin/bash

#accept and create directory
echo "enter directory name:$@";
mkdir $@
echo "directory created $@"
cd $@

#make files
for i in {1..4}
do
touch $@$i.txt
dd bs=10 count=104 </dev/urandom >$@$i.txt
echo "file created $@$i.txt"
done
cd ..
echo "hello"


#zip the files
zip -r $@.zip $@
echo "your zip file is $@.zip"



#reverse the directory name
input="$@"
reverse=""
 len=${#input}
for (( i=$len-1; i>=0; i-- ))
do 
	reverse="$reverse${input:$i:1}"
done
 echo "$reverse"


#make reverse directory
mkdir $reverse
echo "created directory $reverse"
mv $@.zip $reverse
echo "content of $@ moved to $reverse"
cd $reverse


#unzip the files
unzip $@.zip -d $reverse


#read the unzipped files
for i in {1..4}
do
cat $reverse/$@/$@$i.txt
done

