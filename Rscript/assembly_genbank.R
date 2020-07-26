imports "annotation.genbank_kit" from "seqtoolkit";

# Rscript for update genbank assembly file

setwd(!script$dir);

const template as string = "../genbank/CP000050.1.txt";

let assembly = read.genbank(template);