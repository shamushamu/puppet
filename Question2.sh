#!/bin/bash
cat sample2-candidate-data.csv | cut -d "," -f3 | grep TT
echo "TT output"
cat sample2-candidate-data.csv | cut -d "," -f3 | grep PX
echo "PX Output"
