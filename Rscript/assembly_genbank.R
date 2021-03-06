imports "annotation.genbank_kit" from "seqtoolkit";
imports "annotation.terms" from "seqtoolkit";

# Rscript for update genbank assembly file

setwd(!script$dir);

const template as string = "../genbank/CP000050.1.txt";
const COGsbh as string   = "../genome/COG/Xcc8004.myva.myva_COG.csv";

let assembly = read.genbank(template);
let allFeatures = assembly :> enumerateFeatures;

# add COG annotation for each features
let COG = COGsbh 
:> read.MyvaCOG 
:> assign.COG() 
:> sapply(as.object) 
:> which(a -> !str_empty(a$COG))
:> lapply(a => a, names = a -> a$query_name)
;

str(COG);

head(COG) 
:> unlist 
:> as.data.frame 
:> print
;

allFeatures = allFeatures[featureKeys(allFeatures) == "CDS"];
allFeatures = allFeatures[featureMeta(allFeatures, "locus_tag") in names(COG)];
allFeatures = allFeatures :> sapply(function(protein) {
	let COGMeta = COG[[featureMeta(protein, "locus_tag")]];
	
	protein :> addMeta(
		COG      = COGMeta$COG,
		category = COGMeta$COG_category,
		note     = `${COGMeta$COG} ${COGMeta$description}`
	);
});

assembly
:> write.genbank(file = "../genbank/CP000050.1.updated.gbff")
;