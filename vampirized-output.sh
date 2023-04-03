#!/bin/bash

# make fstar output "vampire compliant"

file=$1

# fix declare sort
cat "$file" | \
    sed 's/(declare-sort \(.*\))/(declare-sort \1 0)/g' | \
# fix declare datatypes
   sed "s/^(declare-datatypes () ((Fuel /(declare-datatypes ((Fuel 0)) ((/g" | \
# removes echo
    sed "s/^.*echo.*//g" | \
#
# fix iff and imples
    sed "s/iff/=/g" | \
    sed "s/implies/=>/g" | \
# 
#    smtfmt | \
    sponge "$file"