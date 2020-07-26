imports ["circos", "track.plots", "model"] from "circoskit";
imports "annotation.genbank_kit" from "seqtoolkit";
imports "annotation.genomics_context" from "seqtoolkit";
imports "annotation.genomics" from "seqtoolkit";

setwd(!script$dir);

const genomics = circos(chromosomes_units = 50000);
const genbank = read.genbank("../../genbank/CP000050.1.txt");

let [forwards, reverses] = genbank 
:> genome.genes 
:> [strand.filter("+"), strand.filter("-")]
;

print(`there are ${length(forwards)} genes in forward strand and ${length(reverses)} genes in reverse strand.`);

genomics
:> backbone(source = origin.fasta(genbank), loophole = 1024)
:> ideogram(radius = "0.65r")
:> main
:> add(forwards :> highlight.genemarks(colors = "brown") :> track.highlight)
:> add(reverses :> highlight.genemarks(colors = "blue") :> track.highlight)
:> save(directory = "../circos")
;