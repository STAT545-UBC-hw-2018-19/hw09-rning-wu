words <- readLines("words.txt")
counts <- rep(0, 26)
names(counts) <- letters
for (word in words) {
	for (i in 1:nchar(word)) {
		letter = substring(word, i, i);
		letter = tolower(letter);
		if (letter %in% letters) {
			counts[letter] = counts[letter] + 1;
		}
	}
}

counts = unname(counts)

dataframe = data.frame("Letters" = letters, "Frequency" = counts);
write.csv(dataframe, "letterfreq.csv")