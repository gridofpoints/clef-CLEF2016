# CLEF Monolingual Grid of Points (CLEF 2016)

We selected a set of alternative implementations of each component and by using the [Terrier open source system](http://terrier.org/) we created a run for each system defined by combining the available components in all possible ways.

We considered three main components of an IR system: stop list, Lexical Unit Generator (LUG) and IR model. We selected a set of alternative implementations of each component and by using the Terrier open source system we created a run for each system defined by combining the available components in all possible ways. The components we selected are:

- **stop list**: nostop, short_stop, long_stop
- **LUG**: nolug, weak stemmer, aggressive stemmer, 4grams, 5grams;
- **model**: BB2, BM25, DFRBM25, DFRee, DLH, DLH13, DPH, HiemstraLM, IFB2, InL2, InexpB2, InexpC2, LGD, LemurTFIDF, PL2, TFIDF.

## Content

Content of the directories:
- **matlab**: the Matlab code for running the analyses and reproducing the experiments from the Grid of Points contained in the `data` directory. It requires the [MATTERS library](http://matters.dei.unipd.it/).
- **data**: the Grid of Points for the following all the CLEF monolingual Adhoc collections from 2000 to 2007 and the original Average Precision measures of CLEF monolingual tasks. Files have to be opened with the `serload` command of the [MATTERS library](http://matters.dei.unipd.it/).
- **java**: it contains the extensions to Terrier 4.1 needed for using n-grams and the weak and aggressive stemmers.
- **script**: it contains the shell scripts to index the CLEF collections, create the Terrier configuration files, and produce the run files that constitute the various Grid of Points.

## Reference

Ferro, N. and Silvello, G. (2016). The CLEF Monolingual Grid of Points. In Fuhr, N., Quaresma, P., Gonçalves, T., Larsen, B., Balog, K., Macdonald, C., Cappellato, L., and Ferro, N., editors, Experimental IR Meets Multilinguality, Multimodality, and Interaction. Proceedings of the Seventh International Conference of the CLEF Association (CLEF 2016), pages 13-24. Lecture Notes in Computer Science (LNCS) 9822, Springer, Heidelberg, Germany.

