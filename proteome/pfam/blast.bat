"G:\blast\bin\makeblastdb.exe" -in "F:\GCModeller\CDD\Pfam.fasta" -dbtype prot
"G:\blast\bin\blastp.exe" -query "G:\xcb\Pfam\xcb.fasta" -db "F:\GCModeller\CDD\Pfam.fasta" -out ./xcb-pfam.txt