fstarcsort --sort_type=ilabel ../lm/G.fst | fsttablecompose L_disambig.fst - | fstdeterminizestar --use-log=true | fstminimizeencoded > LG.fst
fstprint --osymbols=words.txt --isymbols=pinyin_disambig.txt LG.fst > LG.fst.w.txt
fstprint LG.fst > LG.fst.txt
