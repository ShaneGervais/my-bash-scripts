#!/bin/bash

echo "Back to work!"

echo "opening brave"

brave-browser </dev/null >/dev/null 2>&1 & disown

echo "opening last work on project"
cd ~/Dev/Research/Calcul_Experimental/Mach_Zedner_Faible
code .
cd ~/Dev/Research/Mesure_faible
code .

echo "have a good day!"