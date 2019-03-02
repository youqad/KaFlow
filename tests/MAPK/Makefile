DOT=$(wildcard output/*.dot)
PDF=$(DOT:.dot=.pdf)
KASIM=KaSim -i ../story.ka -i ../MAPK.ka -l 6 -trace t.json

all: ccores

clean:
	rm -rf output

clean_all: clean
	rm -f *~ *# *.xml *.dat

output:
	mkdir output

output/t.json: output
	cd output; KaSim -i ../story.ka -i ../MAPK.ka -l 6 -trace t.json

ccores: output/t.json
	cd output; ../../../KaFlow t.json -o "story." -r "MEK_phos_MAPK1"
	@make pdf


pdf: $(PDF)

%.pdf: %.dot
	dot -Tpdf $< -o $@
