use Sjis;

$_ = 'あいうえおかきくけこ';
if (substr($_,10) eq 'かきくけこ') {
    print qq{ok - 1 substr(\$_,10) eq 'かきくけこ'\n};
}
else {
    print qq{not ok - 1 substr(\$_,10) eq 'かきくけこ'\n};
}

$_ = 'あいうえおかきくけこ';
if (substr($_,4,6) eq 'うえお') {
    print qq{ok - 2 substr(\$_,4,6) eq 'うえお'\n};
}
else {
    print qq{not ok - 2 substr(\$_,4,6) eq 'うえお'\n};
}

$_ = 'あいうえおかきくけこ';
if (substr($_,4,6,'さしすせそ') eq 'うえお') {
    if ($_ eq 'あいさしすせそかきくけこ') {
        print qq{ok - 3 substr(\$_,4,6,'さしすせそ') eq 'うえお'\n};
    }
    else {
        print qq{not ok - 3 substr(\$_,4,6,'さしすせそ') eq 'うえお'\n};
    }
}
else {
    print qq{not ok - 3 substr(\$_,4,6,'さしすせそ') eq 'うえお'\n};
}

$_ = 'あいうえおかきくけこ';
if (substr($_,-6) eq 'くけこ') {
    print qq{ok - 4 substr(\$_,-6) eq 'くけこ'\n};
}
else {
    print qq{not ok - 4 substr(\$_,-6) eq 'くけこ'\n};
}

$_ = 'あいうえおかきくけこ';
if (substr($_,-10,6) eq 'かきく') {
    print qq{ok - 5 substr(\$_,-10,6) eq 'かきく'\n};
}
else {
    print qq{not ok - 5 substr(\$_,-10,6) eq 'かきく'\n};
}

$_ = 'あいうえおかきくけこ';
if (substr($_,-10,6,'やゆよ') eq 'かきく') {
    if ($_ eq 'あいうえおやゆよけこ') {
        print qq{ok - 6 substr(\$_,-10,6,'やゆよ') eq 'かきく'\n};
    }
    else {
        print qq{not ok - 6 substr(\$_,-10,6,'やゆよ') eq 'かきく'\n};
    }
}
else {
    print qq{not ok - 6 substr(\$_,-10,6,'やゆよ') eq 'かきく'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,5) eq 'かきくけこ') {
    print qq{ok - 7 Sjis::substr(\$_,5) eq 'かきくけこ'\n};
}
else {
    print qq{not ok - 7 Sjis::substr(\$_,5) eq 'かきくけこ'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,2,3) eq 'うえお') {
    print qq{ok - 8 Sjis::substr(\$_,2,3) eq 'うえお'\n};
}
else {
    print qq{not ok - 8 Sjis::substr(\$_,2,3) eq 'うえお'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,2,3,'さしすせそ') eq 'うえお') {
    if ($_ eq 'あいさしすせそかきくけこ') {
        print qq{ok - 9 Sjis::substr(\$_,2,3,'さしすせそ') eq 'うえお'\n};
    }
    else {
        print qq{not ok - 9 Sjis::substr(\$_,2,3,'さしすせそ') eq 'うえお'\n};
    }
}
else {
    print qq{not ok - 9 Sjis::substr(\$_,2,3,'さしすせそ') eq 'うえお'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,-3) eq 'くけこ') {
    print qq{ok - 10 Sjis::substr(\$_,-3) eq 'くけこ'\n};
}
else {
    print qq{not ok - 10 Sjis::substr(\$_,-3) eq 'くけこ'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,-5,3) eq 'かきく') {
    print qq{ok - 11 Sjis::substr(\$_,-5,3) eq 'かきく'\n};
}
else {
    print qq{not ok - 11 Sjis::substr(\$_,-5,3) eq 'かきく'\n};
}

$_ = 'あいうえおかきくけこ';
if (Sjis::substr($_,-5,3,'やゆよ') eq 'かきく') {
    if ($_ eq 'あいうえおやゆよけこ') {
        print qq{ok - 12 Sjis::substr(\$_,-5,3,'やゆよ') eq 'かきく'\n};
    }
    else {
        print qq{not ok - 12 Sjis::substr(\$_,-5,3,'やゆよ') eq 'かきく'\n};
    }
}
else {
    print qq{not ok - 12 Sjis::substr(\$_,-5,3,'やゆよ') eq 'かきく'\n};
}

