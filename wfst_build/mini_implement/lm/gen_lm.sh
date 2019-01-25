awk '{print $1}' ../dict/lexicon.txt | sort | uniq | awk 'BEGIN{idx=0}{print $1,idx++}'> vocab.txt

python word_segmentation.py vocab.txt trans_uniq.txt > text

. /data/lhdong/lhdong/nnet3_kaldi/kaldi-master-20180507/tools/env.sh
# srilm trains ngram
ngram-count -text text -vocab vocab.txt -order 3 -write count.txt
ngram-count -read count.txt -order 3 -lm lm.3gram -interpolate -kndiscount
#ngram-count -read count.txt -order 3 -lm lm.3gram
