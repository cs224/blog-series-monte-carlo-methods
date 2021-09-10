
NOTEBOOKS := $(shell find . -maxdepth 1 -name '*.ipynb' ! -name "0000-*")
HTML := $(NOTEBOOKS:.ipynb=.html)

all: $(HTML)

echo:
	echo $(NOTEBOOKS)

echo_html:
	echo $(HTML)

clean:
	rm *.html

%.html : %.ipynb
	jupyter nbconvert $< --to html --TagRemovePreprocessor.remove_input_tags='{"hide_input"}' --TagRemovePreprocessor.remove_single_output_tags='{"hide_output"}'
