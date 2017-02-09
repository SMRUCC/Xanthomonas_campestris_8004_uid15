#/bin/bash

seqtools /Promoter.Regions.Parser.gb /gb "../genbank/CP000050.1.txt"
seqtools /Promoter.Regions.Palindrome /in "../genbank/CP000050.1.txt" /out "./palindrome_promoter=-250bp.csv"