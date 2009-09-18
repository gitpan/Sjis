use Sjis;

if ("ソアア" =~ qr/^ソ/) {
    print qq{ok - "ソアア" =~ qr/^ソ/\n};
}
else {
    print qq{not ok - "ソアア" =~ qr/^ソ/\n};
}

if ("アソア" !~ qr/^ソ/) {
    print qq{ok - "アソア" !~ qr/^ソ/\n};
}
else {
    print qq{not ok - "アソア" !~ qr/^ソ/\n};
}

if ("アアソ" =~ qr/ソ$/) {
    print qq{ok - "アアソ" =~ qr/ソ\$/\n};
}
else {
    print qq{not ok - "アアソ" =~ qr/ソ\$/\n};
}

if ("アソア" !~ qr/ソ$/) {
    print qq{ok - "アソア" !~ qr/ソ\$/\n};
}
else {
    print qq{not ok - "アソア" !~ qr/ソ\$/\n};
}

if ("アソア" =~ qr/(ア([イソウ])ア)/) {
    if ($1 eq "アソア") {
        if ($2 eq "ソ") {
            print qq{ok - "アソア" =~ qr/(ア([イソウ])ア)/ \$1=($1), \$2=($2)\n};
        }
        else {
            print qq{not ok - "アソア" =~ qr/(ア([イソウ])ア)/ \$1=($1), \$2=($2)\n};
        }
    }
    else {
        print qq{not ok - "アソア" =~ qr/(ア([イソウ])ア)/ \$1=($1), \$2=($2)\n};
    }
}
else {
    print qq{not ok - "アソア" =~ qr/(ア([イソウ])ア)/ \$1=($1), \$2=($2)\n};
}

if ("アソア" !~ qr/(ア([イウエ])ア)/) {
    print qq{ok - "アソア" !~ qr/(ア([イウエ])ア)/ \$1=($1), \$2=($2)\n};
}
else {
    print qq{not ok - "アソア" !~ qr/(ア([イソウ])ア)/ \$1=($1), \$2=($2)\n};
}

if ("アソア" =~ qr/(アソ|イソ)/) {
    if ($1 eq "アソ") {
        print qq{ok - "アソア" =~ qr/(アソ|イソ)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソア" =~ qr/(アソ|イソ)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソア" =~ qr/(アソ|イソ)/ \$1=($1)\n};
}

if ("アソア" !~ qr/(アイ|イウ)/) {
    print qq{ok - "アソア" !~ qr/(アイ|イウ)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソア" !~ qr/(アイ|イウ)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(アソ?)/) {
    if ($1 eq "アソ") {
        print qq{ok - "アソソ" =~ qr/(アソ?)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(アソ?)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(アソ?)/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イソ?)/) {
    print qq{ok - "アソソ" !~ qr/(イソ?)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イソ?)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(アソソ?)/) {
    if ($1 eq "アソソ") {
        print qq{ok - "アソソ" =~ qr/(アソソ?)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(アソソ?)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(アソソ?)/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イソソ?)/) {
    print qq{ok - "アソソ" !~ qr/(イソソ?)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イソソ?)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(アソ+)/) {
    if ($1 eq "アソソ") {
        print qq{ok - "アソソ" =~ qr/(アソ+)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(アソ+)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(アソ+)/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イソ+)/) {
    print qq{ok - "アソソ" !~ qr/(イソ+)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イソ+)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(アソ*)/) {
    if ($1 eq "アソソ") {
        print qq{ok - "アソソ" =~ qr/(アソ*)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(アソ*)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(アソ*)/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イソ*)/) {
    print qq{ok - "アソソ" !~ qr/(イソ*)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イソ*)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(ア.)/) {
    if ($1 eq "アソ") {
        print qq{ok - "アソソ" =~ qr/(ア.)/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(ア.)/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(ア.)/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イ.)/) {
    print qq{ok - "アソソ" !~ qr/(イ.)/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イ.)/ \$1=($1)\n};
}

if ("アソソ" =~ qr/(ア.{2})/) {
    if ($1 eq "アソソ") {
        print qq{ok - "アソソ" =~ qr/(ア.{2})/ \$1=($1)\n};
    }
    else {
        print qq{not ok - "アソソ" =~ qr/(ア.{2})/ \$1=($1)\n};
    }
}
else {
    print qq{not ok - "アソソ" =~ qr/(ア.{2})/ \$1=($1)\n};
}

if ("アソソ" !~ qr/(イ.{2})/) {
    print qq{ok - "アソソ" !~ qr/(イ.{2})/ \$1=($1)\n};
}
else {
    print qq{not ok - "アソソ" !~ qr/(イ.{2})/ \$1=($1)\n};
}

