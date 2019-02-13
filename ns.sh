#/bin/bash
echo "Please enter the domain"
read domain
python knockpy/knockpy.py -j $domain
echo "Enter the json file name"
read filename
test=$(grep 'target' $filename| awk -F '"target":' '{print $2}'| tr -d \",)
echo $test
echo "Which record You would like to get ?"
read q
for i in $test
do 
	nslookup -q=$q $i
done
