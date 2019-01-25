num_disambig=`/data/lhdong/lhdong/kaldi/egs/hkust/utils/add_lex_disambig.pl lexicon.txt lexicon_disambig.txt`
echo $num_disambig+1
python gen_pinyin_raw.py

cat pinyin_disambig_raw.txt | awk '{n=NR+1; print $1, n;}
BEGIN {print "<eps> 0";
print "#0 1"}' > pinyin_disambig.txt
