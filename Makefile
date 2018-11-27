all: report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html letterfreq.png letterfreq.csv letterfreq.md
	rm -rf letterfreq_files/

letterfreq.csv: letterfreq.r words.txt
	Rscript $<

report.html: letterfreq.rmd letterfreq.csv
	Rscript -e 'rmarkdown::render("$<")'

words.txt: /usr/share/dict/words
	cp $< $@
