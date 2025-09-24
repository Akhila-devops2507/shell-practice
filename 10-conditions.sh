#!/bin/bash

#!/bin/bash

number=$1

if [ "$number" -lt 100 ]; then
    echo "Given number $number is less than 100"
elif [ "$number" -eq 100 ]; then
    echo "Given number $number is equal to 100"
else
    echo "Given number $number is greater than 100"
fi
