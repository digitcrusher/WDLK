#!/bin/sh -e

cd parts/
for tex in *.tex; do
  pdf=${tex%.tex}.pdf
  if [ ! -e "$pdf" ] || [ $(stat -c %Y "$tex") -gt $(stat -c %Y "$pdf") ]; then
    pdflatex "$tex"
  fi
done
cd ..
pdflatex main.tex
mv main.pdf script_wdlk.pdf
