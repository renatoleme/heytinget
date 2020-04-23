#!/usr/bin/zsh
# -*- coding: utf-8 -*-
#
#  h_cmodel.sh
#  
#  Heyting (topological) counter-model finder.
#
#  Copyright 2019 Renato Reis Leme <renato@logos>
#

# Program

trans/trans $1
expr="$(cat t_out) != X"
n_prop=$(echo $1 | sed -f <(printf 's/%s//2g\n' {a..z}) <<<"$a" | tr -cd '[:alpha:]' | wc -c)

echo "Searching for counter-models to $1 ... \n"

for topo in $(cat topos.t)
do

	sed "s/%EXPR/$expr/g" is_cm.py > eval.py
	sed -i -e "s/%TOPOLOGY/$topo/g" eval.py 
	python eval.py $n_prop
	
done

echo "\n... done."

rm eval.py
rm t_out
