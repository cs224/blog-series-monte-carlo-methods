
NOTEBOOKS := $(shell find . -maxdepth 1 -name '*.ipynb' ! -name "0000-*")
HTML := $(NOTEBOOKS:.ipynb=.html)

all: $(HTML)

install_theme:
	rm -rf $${HOME}/.local/share/jupyter/nbconvert/templates/jptrblogtheme &&	ln -s $(shell readlink -f ./jptrblogtheme) $${HOME}/.local/share/jupyter/nbconvert/templates/jptrblogtheme

echo:
	echo $(NOTEBOOKS)

echo_html:
	echo $(HTML)

clean:
	rm -f $(NOTEBOOKS:.ipynb=.html) $(NOTEBOOKS:.ipynb=.md)

%.md : %.ipynb
	jupyter nbconvert $< --to html --template jptrblogtheme --TagRemovePreprocessor.remove_input_tags "hide_input" --TagRemovePreprocessor.remove_single_output_tags "hide_output" --stdout > $@

%.html : %.ipynb
	jupyter nbconvert $< --to html --template lab --TagRemovePreprocessor.remove_input_tags="hide_input" --TagRemovePreprocessor.remove_single_output_tags="hide_output"
