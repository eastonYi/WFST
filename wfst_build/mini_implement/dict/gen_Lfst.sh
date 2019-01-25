/data/lhdong/lhdong/kaldi/egs/hkust/utils/make_lexicon_fst.pl lexicon_disambig.txt 0 SIL '#2' | fstcompile --isymbols=pinyin_disambig.txt --osymbols=words.txt --keep_isymbols=false --keep_osymbols=false > L_raw.fst

phone_disambig_symbol=`grep \#0 pinyin_disambig.txt | awk '{print $2}'`
word_disambig_symbol=`grep \#0 words.txt | awk '{print $2}'`

fstaddselfloops "echo $phone_disambig_symbol |" "echo $word_disambig_symbol |" L_raw.fst | \
fstarcsort --sort_type=olabel > L_disambig.fst
fstprint --isymbols=pinyin_disambig.txt --osymbols=words.txt L_disambig.fst > L_disambig.fst.w.txt
