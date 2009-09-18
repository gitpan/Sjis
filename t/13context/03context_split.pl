use Sjis;

$text = '‚h‚nD‚r‚x‚rF‚Q‚Q‚T‚T‚T‚WF‚X‚T|‚P‚O|‚O‚RF|‚|‚“‚ˆF‚‚‚”‚‰‚‚‚‚Œ';

# 7.7 split‰‰Zq(ƒŠƒXƒgƒRƒ“ƒeƒLƒXƒg)
@_ = split(/F/, $text);
if (join('', map {"($_)"} @_) eq "(‚h‚nD‚r‚x‚r)(‚Q‚Q‚T‚T‚T‚W)(‚X‚T|‚P‚O|‚O‚R)(|‚|‚“‚ˆ)(‚‚‚”‚‰‚‚‚‚Œ)") {
    print qq{ok - 1 \@_ = split(/F/, \$text);\n};
}
else {
    print qq{not ok - 1 \@_ = split(/F/, \$text);\n};
}

# 7.7 split‰‰Zq(ƒXƒJƒ‰ƒRƒ“ƒeƒLƒXƒg)
$a = split(/F/, $text);
if (join('', map {"($_)"} @_) eq "(‚h‚nD‚r‚x‚r)(‚Q‚Q‚T‚T‚T‚W)(‚X‚T|‚P‚O|‚O‚R)(|‚|‚“‚ˆ)(‚‚‚”‚‰‚‚‚‚Œ)") {
    print qq{ok - 2 \$a = split(/F/, \$text);\n};
}
else {
    print qq{not ok - 2 \$a = split(/F/, \$text);\n};
}

# 7.7 split‰‰Zq(voidƒRƒ“ƒeƒLƒXƒg)
split(/F/, $text);
if (join('', map {"($_)"} @_) eq "(‚h‚nD‚r‚x‚r)(‚Q‚Q‚T‚T‚T‚W)(‚X‚T|‚P‚O|‚O‚R)(|‚|‚“‚ˆ)(‚‚‚”‚‰‚‚‚‚Œ)") {
    print qq{ok - 3 (void) split(/F/, \$text);\n};
}
else {
    print qq{not ok - 3 (void) split(/F/, \$text);\n};
}

