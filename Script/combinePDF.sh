#!/bin/bash

# combine multiple pdfs into one file
# required package: pdftk
# see man pdftk for more information

pdftk *.pdf cat output out.pdf
