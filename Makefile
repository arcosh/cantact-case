
all: part-bottom.stl part-lid.stl

%.stl: %.scad
	openscad $^ -o $@

clean:
	rm -f part-*.stl

