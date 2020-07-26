imports ["circos", "track.plots", "model"] from "circoskit";
imports "annotation.genbank_kit" from "seqtoolkit";
imports "annotation.genomics_context" from "seqtoolkit";
imports "annotation.genomics" from "seqtoolkit";
imports "annotation.terms" from "seqtoolkit";

setwd(!script$dir);

print("found circos script at location:");
print(circos.pl());

const genomics = circos(chromosomes_units = 50000);
const genbank = read.genbank("../../genbank/CP000050.1.txt");

print("filter genes by strand +/-");

let [forwards, reverses] = genbank 
:> genome.genes 
:> [strand.filter("+"), strand.filter("-")]
;

print(`there are ${length(forwards)} genes in forward strand and ${length(reverses)} genes in reverse strand.`);
print("create geneName text labels...");

# create geneName text labels for circos track plot
let geneLabels = genbank 
:> genome.genes
:> sapply(as.object) 
:> lapply(gene => list(geneName = geneNames(gene$Product), gene = gene), names = gene -> gene$Synonym)
:> which(gene => length(gene$geneName) > 0)
:> which(gene => !str_empty(gene$geneName))
:> sapply(function(obj) {
	let loci  = as.object(obj$gene$Location);
	let left  = loci$Start;
	let right = loci$Ends;
	
	text(start = left, end = right, text = obj$geneName);
})
:> as.vector("text")
;

print(`create ${length(geneLabels)} text labels for circos plot.`);

genomics
:> backbone(source = origin.fasta(genbank), loophole = 1024)
:> ideogram(radius = "0.3r")
:> main
:> add(track.text(geneLabels, snuggle_refine = "no", label_snuggle = "no")  :> radius01(r1 = 3.5, r0 = 2.1), auto_layout = FALSE)
:> add(forwards :> highlight.genemarks(colors = "brown") :> track.highlight :> radius01(r1 = 2.085, r0 = 2.05), auto_layout = FALSE)
:> add(reverses :> highlight.genemarks(colors = "blue") :> track.highlight  :> radius01(r1 = 2.045, r0 = 2), auto_layout = FALSE)
:> save(directory = "../circos")
;

print("[Job done!]");