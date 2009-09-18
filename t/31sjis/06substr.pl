use Sjis;

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,10) eq '‚©‚«‚­‚¯‚±') {
    print qq{ok - 1 substr(\$_,10) eq '‚©‚«‚­‚¯‚±'\n};
}
else {
    print qq{not ok - 1 substr(\$_,10) eq '‚©‚«‚­‚¯‚±'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,4,6) eq '‚¤‚¦‚¨') {
    print qq{ok - 2 substr(\$_,4,6) eq '‚¤‚¦‚¨'\n};
}
else {
    print qq{not ok - 2 substr(\$_,4,6) eq '‚¤‚¦‚¨'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,4,6,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨') {
    if ($_ eq '‚ ‚¢‚³‚µ‚·‚¹‚»‚©‚«‚­‚¯‚±') {
        print qq{ok - 3 substr(\$_,4,6,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
    }
    else {
        print qq{not ok - 3 substr(\$_,4,6,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
    }
}
else {
    print qq{not ok - 3 substr(\$_,4,6,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,-6) eq '‚­‚¯‚±') {
    print qq{ok - 4 substr(\$_,-6) eq '‚­‚¯‚±'\n};
}
else {
    print qq{not ok - 4 substr(\$_,-6) eq '‚­‚¯‚±'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,-10,6) eq '‚©‚«‚­') {
    print qq{ok - 5 substr(\$_,-10,6) eq '‚©‚«‚­'\n};
}
else {
    print qq{not ok - 5 substr(\$_,-10,6) eq '‚©‚«‚­'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (substr($_,-10,6,'‚â‚ä‚æ') eq '‚©‚«‚­') {
    if ($_ eq '‚ ‚¢‚¤‚¦‚¨‚â‚ä‚æ‚¯‚±') {
        print qq{ok - 6 substr(\$_,-10,6,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
    }
    else {
        print qq{not ok - 6 substr(\$_,-10,6,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
    }
}
else {
    print qq{not ok - 6 substr(\$_,-10,6,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,5) eq '‚©‚«‚­‚¯‚±') {
    print qq{ok - 7 Sjis::substr(\$_,5) eq '‚©‚«‚­‚¯‚±'\n};
}
else {
    print qq{not ok - 7 Sjis::substr(\$_,5) eq '‚©‚«‚­‚¯‚±'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,2,3) eq '‚¤‚¦‚¨') {
    print qq{ok - 8 Sjis::substr(\$_,2,3) eq '‚¤‚¦‚¨'\n};
}
else {
    print qq{not ok - 8 Sjis::substr(\$_,2,3) eq '‚¤‚¦‚¨'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,2,3,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨') {
    if ($_ eq '‚ ‚¢‚³‚µ‚·‚¹‚»‚©‚«‚­‚¯‚±') {
        print qq{ok - 9 Sjis::substr(\$_,2,3,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
    }
    else {
        print qq{not ok - 9 Sjis::substr(\$_,2,3,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
    }
}
else {
    print qq{not ok - 9 Sjis::substr(\$_,2,3,'‚³‚µ‚·‚¹‚»') eq '‚¤‚¦‚¨'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,-3) eq '‚­‚¯‚±') {
    print qq{ok - 10 Sjis::substr(\$_,-3) eq '‚­‚¯‚±'\n};
}
else {
    print qq{not ok - 10 Sjis::substr(\$_,-3) eq '‚­‚¯‚±'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,-5,3) eq '‚©‚«‚­') {
    print qq{ok - 11 Sjis::substr(\$_,-5,3) eq '‚©‚«‚­'\n};
}
else {
    print qq{not ok - 11 Sjis::substr(\$_,-5,3) eq '‚©‚«‚­'\n};
}

$_ = '‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±';
if (Sjis::substr($_,-5,3,'‚â‚ä‚æ') eq '‚©‚«‚­') {
    if ($_ eq '‚ ‚¢‚¤‚¦‚¨‚â‚ä‚æ‚¯‚±') {
        print qq{ok - 12 Sjis::substr(\$_,-5,3,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
    }
    else {
        print qq{not ok - 12 Sjis::substr(\$_,-5,3,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
    }
}
else {
    print qq{not ok - 12 Sjis::substr(\$_,-5,3,'‚â‚ä‚æ') eq '‚©‚«‚­'\n};
}

