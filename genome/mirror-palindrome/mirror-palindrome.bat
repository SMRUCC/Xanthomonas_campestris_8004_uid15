#!/bin/bash

seqtools /Promoter.Regions.Palindrome /in "../../genbank/CP000050.1.txt" /min 4 /len 250 /mirror /out "./CP000050.1_min=4,max=20,upstream=-250bp.palindrome-mirror.csv"
seqtools /Promoter.Palindrome.Fasta /in "./CP000050.1_min=4,max=20,upstream=-250bp.palindrome-mirror.csv"