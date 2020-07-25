imports ["circos", "track.plots"] from "circoskit";
imports "annotation.genbank_kit" from "seqtoolkit";

const genomics = circos(chromosomes_units = 50000);
const genbank = read.genbank("../../genbank/CP000050.1.txt");

genomics
:> backbone(source = origin.fasta(genbank), loophole = 1024)
:> ideogram(radius = "0.65r")
:> save(directory = "../circos")
;