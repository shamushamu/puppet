#!/bin/bash
cat sample2-candidate-data.csv | cut -d "," -f6 | cut -d "." -f1 | sort
