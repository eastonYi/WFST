#!/usr/bin/env python

with open('lexicon_disambig.txt') as f:
    list_pinyin = []
    for line in f:
        list_pinyin.extend(line.strip().split('\t')[1].split())
    list_pinyin = list(set(list_pinyin))
    list_pinyin.sort()

with open('pinyin_disambig_raw.txt', 'w') as fw:
    [fw.write(pinyin+'\n') for pinyin in list_pinyin]
