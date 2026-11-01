#!/bin/bash
#3 November, 2018
#To use it: bash mobility.sh
y=-0.0002058319817598                           #"y" stands for the lattice constant in y direction
z=10.7433405429017483
for i in $(seq 0.985 0.005 1.015)                #"i" defines the range of strain
do
mkdir $i
cd $i
mkdir relax scf band
cd ./relax
cp ../../../KPOINTS .
cp ../../../INCAR .
cp ../../../POTCAR .
cp ../../../POSCAR .
cp ../../../vasp.pbs .
sed -i "4s/$y/$(echo "$y*$i"|bc)/g" ./POSCAR
sed -i "4s/$z/$(echo "$z*$i"|bc)/g" ./POSCAR
cd ..
cd ..
done
