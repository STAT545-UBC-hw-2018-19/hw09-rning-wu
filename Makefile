all: report.html

clean:
	rm -f words.txt histogram.tsv histogram.png report.md report.html letterfreq.png letterfreq.csv letterfreq.md
	rm -rf /letterfreq_files

letterfreq.csv: letterfreq.r words.txt
	Rscript $<

#letterfreq.png: letterfreq.csv
#	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'

report.html: letterfreq.rmd letterfreq.csv
	Rscript -e 'rmarkdown::render("$<")'
	rm Rplots.pdf

#histogram.png: histogram.tsv
#	Rscript -e 'library(ggplot2); qplot(Length, Freq, data=read.delim("$<")); ggsave("$@")'
#	rm Rplots.pdf

#histogram.tsv: histogram.r words.txt
#	Rscript $<

words.txt: /usr/share/dict/words
	cp $< $@

# words.txt:
#	Rscript -e 'download.file("http://svnweb.freebsd.org/base/head/share/dict/web2?view=co", destfile = "words.txt", quiet = TRUE)'
