
bin_tree: bin_tree.mli bin_tree.ml
	ocamlc -c bin_tree.mli bin_tree.ml

g_tree: g_tree.mli g_tree.ml
	ocamlc -c g_tree.mli g_tree.ml

st_tree: st_tree.mli st_tree.ml
	ocamlc -c st_tree.mli st_tree.ml

ej91: bin_tree ej91.mli ej91.ml
	ocamlc -c bin_tree.cmo ej91.mli ej91.ml

ej92: bin_tree ej92.mli ej92.ml
	ocamlc -c bin_tree.cmo ej92.mli ej92.ml

ej93: g_tree ej93.mli ej93.ml
	ocamlc -c g_tree.cmo ej93.mli ej93.ml

ej94: st_tree ej94.mli ej94.ml
	ocamlc -c st_tree.cmo ej94.mli ej94.ml

clean:
	rm -f *.cmi *.cmo

