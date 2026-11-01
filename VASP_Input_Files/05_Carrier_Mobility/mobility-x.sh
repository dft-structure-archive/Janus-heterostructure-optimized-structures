#!/bin/bash
#3 November, 2018
#To use it: bash mobility.sh
x=6.2026421950752502                            #"x" stands for the lattice constant in x direction
for i in $(seq 0.985 0.005 1.015)                #"i" defines the range of strain
do
mkdir $i
cd $i
mkdir relax scf band
cd ./relax
cp ../../../KPOINTS .
cp ../../../INCAR .
cp ../../../POTCAR .
cp ../../../vasp.pbs .
cp ../../../POSCAR .
sed -i "3s/$x/$(echo "$x*$i"|bc)/g" ./POSCAR
cd ..
cd ..
done
