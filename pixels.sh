#!/bin/sh

sleep 5
nbframes=10
middle=325 #in my case i had minecraft on only half of my screen so i changed this value from 716 to 325
start=$(date +%s)
for i in `seq 0 $nbframes`
do
    for i in `seq 0 42`
    do
        DEPTH=`echo $(grabc -w 0x5800009 -rgb -l +$middle+$((i*12+128)) 2>&1 > /dev/null| cut -f1 -d,)`
        DEPTH=$((DEPTH/5)) # from 0->255 to 0->51 for practical displaying reasons
        line=""
        for i in `seq 0 $DEPTH`
        do
            line="$line*"
        done
        echo "$line"
    done
    printf "\033c"
    sleep 0.05
done
end=$(date +%s)
seconds=$((end-start))
echo "execution finished in $seconds seconds"
echo "so approximatively $(echo "scale=2; $nbframes / $seconds" | bc) fps"

# this script has been created by Yruama, feel free to edit and reuse it as you want
