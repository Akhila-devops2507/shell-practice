#!/bin/bash

NUMBER1=10
NUMBER2=20

SUM=$((NUMBER1 + NUMBER2))
echo "Sum is: $SUM"

LEADERS=("modi" "yogi" "adityanath" "rajnath" "shah")
echo "All leaders: ${LEADERS[@]}"
echo "First leader: ${LEADERS[0]}"
echo "Number of leaders: ${#LEADERS[@]}"