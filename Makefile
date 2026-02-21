# Generate README.md witth TOC  from docs/README.md
MARKDOWN_TOC = markdown-toc-go
GLOSSARY_FILE = docs/glossary.txt
INPUT = ./docs/README.md
README = ./README.md
	
.PHONY: docs
docs:
	$(MARKDOWN_TOC) -i $(INPUT) -o $(README) \
        --glossary $(GLOSSARY_FILE) -f
	$(MARKDOWN_TOC) -no-credit -i docs/ChangeLog.md \
		-o ./ChangeLog.md --glossary $(GLOSSARY_FILE) -f


.PHONEY: tz
tz:
	@./scripts/mk_tgz.sh

clean:
	/bin/rm -f *.gz
