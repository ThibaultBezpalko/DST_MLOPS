#!/bin/bash

# Launch in background the api with : ./api &

# List of graphic cards for which retrieving infos
graphic_cards=(rtx3060 rtx3070 rtx3080 rtx3090 rx6700)

# For loop to curl on each card
echo "$(date)" >> ~/exam_BEZPALKO/exam_bash/sales.txt
for gc in ${graphic_cards[*]}
do
sale=`curl "http://0.0.0.0:5000/$gc"` 
echo "$gc:$sale" >> ~/exam_BEZPALKO/exam_bash/sales.txt
done
