######################################################################
#
# Esjis - Source code filter to escape ShiftJIS
#
# Copyright (c) 2008 INABA Hitoshi <ina@cpan.org>
#
######################################################################

use strict;
use 5.00503;

use vars qw($VERSION);
$VERSION = sprintf '%d.%02d', q$Revision: 0.11 $ =~ m/(\d+)/xmsg;

use constant DEBUG => 1;
local $SIG{__WARN__} = sub { die 'esjis: ', @_ } if DEBUG;
local $^W = 1;

# if use eval in regexp then 1 else 0.
use constant USE_REGEXP_EVAL => 0;

BEGIN {
    if ($^X =~ m/jperl/xmsi) {
        die "esjis: need perl(not jperl) 5.00503 or later. (\$^X==$^X)";
    }
}

# regexp of character
my $qq_char = qr/[^\\\x81-\x9F\xE0-\xFC]|[\\\x81-\x9F\xE0-\xFC][\x00-\xFF]|\\[\x81-\x9F\xE0-\xFC][\x00-\xFF]/xms;
my  $q_char = qr/[^\x81-\x9F\xE0-\xFC]|[\x81-\x9F\xE0-\xFC][\x00-\xFF]/xms;
my $chargap = qr/\G(?:[\x81-\x9F\xE0-\xFC]{2})*?|[^\x81-\x9F\xE0-\xFC](?:[\x81-\x9F\xE0-\xFC]{2})*?/xms;

# regexp of nested parens in qqXX
my $qq_paren   = qr{(?{local $nest=0}) (?>(?:
                    [^\\\x81-\x9F\xE0-\xFC()]  | [\\\x81-\x9F\xE0-\xFC][\x00-\xFF] | \\[\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                          \(   (?{$nest++}) |
                                          \)   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $qq_brace   = qr{(?{local $nest=0}) (?>(?:
                    [^\\\x81-\x9F\xE0-\xFC{}]  | [\\\x81-\x9F\xE0-\xFC][\x00-\xFF] | \\[\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                          \{   (?{$nest++}) |
                                          \}   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $qq_bracket = qr{(?{local $nest=0}) (?>(?:
                    [^\\\x81-\x9F\xE0-\xFC[\]] | [\\\x81-\x9F\xE0-\xFC][\x00-\xFF] | \\[\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                          \[   (?{$nest++}) |
                                          \]   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $qq_angle   = qr{(?{local $nest=0}) (?>(?:
                    [^\\\x81-\x9F\xE0-\xFC<>]  | [\\\x81-\x9F\xE0-\xFC][\x00-\xFF] | \\[\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                          \<   (?{$nest++}) |
                                          \>   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;

# regexp of nested parens in qXX
my $q_paren    = qr{(?{local $nest=0}) (?>(?:
                    [^\x81-\x9F\xE0-\xFC()]  | [\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                        \(   (?{$nest++}) |
                                        \)   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $q_brace    = qr{(?{local $nest=0}) (?>(?:
                    [^\x81-\x9F\xE0-\xFC{}]  | [\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                        \{   (?{$nest++}) |
                                        \}   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $q_bracket  = qr{(?{local $nest=0}) (?>(?:
                    [^\x81-\x9F\xE0-\xFC[\]] | [\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                        \[   (?{$nest++}) |
                                        \]   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;
my $q_angle    = qr{(?{local $nest=0}) (?>(?:
                    [^\x81-\x9F\xE0-\xFC<>]  | [\x81-\x9F\xE0-\xFC][\x00-\xFF] |
                                        \<   (?{$nest++}) |
                                        \>   (?(?{$nest>0})(?{$nest--})|(?!)))*) (?(?{$nest!=0})(?!))
                 }xms;

# When this script is main program
if ($0 eq __FILE__) {

    # show usage
    unless (@ARGV) {
        die <<END;
esjis: usage

perl $0 ShiftJIS_script.pl > Escaped_script.pl.e
END
    }

    # read ShiftJIS script
    $_ = join '', <>;
    if (/^use Sjis;\n/) {
        print $_;
        exit 0;
    }
    print "use Sjis;\n";

    # while all script
    while (not /\G \z/xgc) {
        print &escape;
    }
    exit 0;
}

# escape ShiftJIS script
sub escape {

    # ignore space, comment
    if (/\G (\s+|\#.*) /xgc) { return $1; }

# split
    elsif (m{\G \b split (\s* \( \s*) m\s*(\S)\2 }xgc) { return "Sjis::Split$1''";  }
    elsif (m{\G \b split (\s* \( \s*) //         }xgc) { return "Sjis::Split$1''";  }
    elsif (m{\G \b split (\s*)        m\s*(\S)\2 }xgc) { return "Sjis::Split$1''";  }
    elsif (m{\G \b split (\s*)        //         }xgc) { return "Sjis::Split$1''";  }
    elsif (m{\G \b split \b                      }xgc) { return 'Sjis::Split';      }

# chop
    elsif (m{\G \b chop  \b                      }xgc) { return 'Sjis::Chop';       }

# tr/// y///
    elsif (/\G \b (tr|y)  \b /xgc) {
        die "esjis: Can't use $1, use function Sjis::trans.";
    }

# q//
    elsif (/\G \b (q) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:\\\#|\\\\|$q_char)*?) (\#) /xgc) {
            return &e_q($ope,$1,$3,$2);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:\\\)|\\\\|$q_paren)*?)   (\)) /xgc) { return $e . &e_q($ope,$1,$3,$2); }
                elsif (/\G (\{) ((?:\\\}|\\\\|$q_brace)*?)   (\}) /xgc) { return $e . &e_q($ope,$1,$3,$2); }
                elsif (/\G (\[) ((?:\\\]|\\\\|$q_bracket)*?) (\]) /xgc) { return $e . &e_q($ope,$1,$3,$2); }
                elsif (/\G (\<) ((?:\\\>|\\\\|$q_angle)*?)   (\>) /xgc) { return $e . &e_q($ope,$1,$3,$2); }
                elsif (/\G (\') ((?:\\\1|\\\\|$q_char)*?)    (\') /xgc) { return $e . &e_q($ope,$1,$3,$2); } #'
                elsif (/\G (\S) ((?:\\\1|\\\\|$q_char)*?)    (\1) /xgc) { return $e . &e_q($ope,$1,$3,$2); }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# qq//
    elsif (/\G \b (qq) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:$qq_char)*?) (\#) /xgc) {
            return &e_qq($ope,$1,$3,$2);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:$qq_paren)*?)   (\)) /xgc) { return $e . &e_qq($ope,$1,$3,$2); }
                elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) /xgc) { return $e . &e_qq($ope,$1,$3,$2); }
                elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) /xgc) { return $e . &e_qq($ope,$1,$3,$2); }
                elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) /xgc) { return $e . &e_qq($ope,$1,$3,$2); }
                elsif (/\G (\') ((?:$qq_char)*?)    (\') /xgc) { return $e . &e_qq($ope,$1,$3,$2); } #'
                elsif (/\G (\S) ((?:$qq_char)*?)    (\1) /xgc) { return $e . &e_qq($ope,$1,$3,$2); }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# qx//
    elsif (/\G \b (qx) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:$qq_char)*?) (\#) /xgc) {
            return &e_qx($ope,$1,$3,$2);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:$qq_paren)*?)   (\)) /xgc) { return $e . &e_qx($ope,$1,$3,$2); }
                elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) /xgc) { return $e . &e_qx($ope,$1,$3,$2); }
                elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) /xgc) { return $e . &e_qx($ope,$1,$3,$2); }
                elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) /xgc) { return $e . &e_qx($ope,$1,$3,$2); }
                elsif (/\G (\') ((?:$qq_char)*?)    (\') /xgc) { return $e . &e_q ($ope,$1,$3,$2); } #'
                elsif (/\G (\S) ((?:$qq_char)*?)    (\1) /xgc) { return $e . &e_qx($ope,$1,$3,$2); }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# m//
    elsif (/\G \b (m) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:$qq_char)*?) (\#) ([a-z]*) /xgc) {
            return &e_m($ope,$1,$3,$2,$4);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_m  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_m  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_m  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_m  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_m_q($ope,$1,$3,$2,$4); } #'
                elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_m  ($ope,$1,$3,$2,$4); }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# s///
    elsif (/\G \b (s) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:$qq_char)*?) (\#) ((?:$qq_char)*?) (\#) ([a-z]*) /xgc) {
            my $re = &e_s($ope,$1,$3,$2);
            return $re . &e_s_qq($ope,'',$5,$4,$6,$re);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:$qq_paren)*?) (\)) /xgc) {
                    my $re = &e_s($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_s_q2($ope,$1,$3,$2,$4,$re); } #'
                        elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
                elsif (/\G (\{) ((?:$qq_brace)*?) (\}) /xgc) {
                    my $re = &e_s($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_s_q2($ope,$1,$3,$2,$4,$re); } #'
                        elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
                elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) /xgc) {
                    my $re = &e_s($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_s_q2($ope,$1,$3,$2,$4,$re); } #'
                        elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
                elsif (/\G (\<) ((?:$qq_angle)*?) (\>) /xgc) {
                    my $re = &e_s($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_s_q2($ope,$1,$3,$2,$4,$re); } #'
                        elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
                elsif (/\G (\') ((?:$qq_char)*?) (\1) /xgc) { #'
                    my $end = $1;
                    my $re  = &e_s_q($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\))   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\})   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\])   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>)   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G      ((?:$qq_char)*?)    ($end) ([a-z]*) /xgc) { return $e . &e_s_q2($ope,'',$2,$1,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
                elsif (/\G (\S) ((?:$qq_char)*?) (\1) /xgc) {
                    my $end = $1;
                    my $re  = &e_s($ope,$1,$3,$2);
                    $e .= $re;
                    while (not /\G \z/xgc) {
                        if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                        elsif (/\G (\() ((?:$qq_paren)*?)   (\))   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\{) ((?:$qq_brace)*?)   (\})   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\[) ((?:$qq_bracket)*?) (\])   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G (\<) ((?:$qq_angle)*?)   (\>)   ([a-z]*) /xgc) { return $e . &e_s_qq($ope,$1,$3,$2,$4,$re); }
                        elsif (/\G      ((?:$qq_char)*?)    ($end) ([a-z]*) /xgc) { return $e . &e_s_qq($ope,'',$2,$1,$4,$re); }
                    }
                    die "esjis: operator $ope can't find delimiter.\n";
                }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# qr//
    elsif (/\G \b (qr) \b /xgc) {
        my $ope = $1;
        if (/\G (\#) ((?:$qq_char)*?) (\#) ([a-z]*) /xgc) {
            return &e_qr($ope,$1,$3,$2,$4);
        }
        else {
            my $e = '';
            while (not /\G \z/xgc) {
                if (/\G (\s+|\#.*) /xgc) { $e .= $1; }
                elsif (/\G (\() ((?:$qq_paren)*?)   (\)) ([a-z]*) /xgc) { return $e . &e_qr  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\{) ((?:$qq_brace)*?)   (\}) ([a-z]*) /xgc) { return $e . &e_qr  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\[) ((?:$qq_bracket)*?) (\]) ([a-z]*) /xgc) { return $e . &e_qr  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\<) ((?:$qq_angle)*?)   (\>) ([a-z]*) /xgc) { return $e . &e_qr  ($ope,$1,$3,$2,$4); }
                elsif (/\G (\') ((?:$qq_char)*?)    (\') ([a-z]*) /xgc) { return $e . &e_qr_q($ope,$1,$3,$2,$4); } #'
                elsif (/\G (\S) ((?:$qq_char)*?)    (\1) ([a-z]*) /xgc) { return $e . &e_qr  ($ope,$1,$3,$2,$4); }
            }
            die "esjis: operator $ope can't find delimiter.\n";
        }
    }

# ''
    elsif (/\G (?<!\w) (\') ((?:\\\'|\\\\|$q_char)*?) (\') /xgc) { return &e_q('',$1,$3,$2); } #'

# ""
    elsif (/\G (\") ((?:$qq_char)*?) (\") /xgc)                  { return &e_qq('qq',$1,$3,$2); } #"

# ``
    elsif (/\G (\`) ((?:$qq_char)*?) (\`) /xgc)                  { return &e_qx('qx',$1,$3,$2); }

# //
    elsif (/\G (\/) ((?:$qq_char)*?) (\/) ([a-z]*) /xgc)         { return &e_m ('m', $1,$3,$2,$4); }

# ??
    elsif (/\G (\?) ((?:$qq_char)*?) (\?) ([a-z]*) /xgc)         { return &e_m ('m', $1,$3,$2,$4); }

# <<
    elsif (/\G (?= << ) /xmsgc) {
        my $e = '';
        my @delimiter = ();
        my %quote_type = ();
        while (not /\G $/xmsgc) {

# <<'HEREDOC'
            if (/\G ( << '(\w*)' ) /xmsgc) {
                $e .= $1;
                push @delimiter, $2;
                $quote_type{$2} = 'q';
            }

# <<\HEREDOC
            elsif (/\G ( << \\(\w+) ) /xmsgc) {
                $e .= $1;
                push @delimiter, $2;
                $quote_type{$2} = 'q';
            }

# <<"HEREDOC"
            elsif (/\G ( << "(\w*)" ) /xmsgc) {
                $e .= $1;
                push @delimiter, $2;
                $quote_type{$2} = 'qq';
            }

# <<HEREDOC
            elsif (/\G ( << (\w+) ) /xmsgc) {
                $e .= $1;
                push @delimiter, $2;
                $quote_type{$2} = 'qq';
            }

# <<`HEREDOC`
            elsif (/\G ( << `(\w*)` ) /xmsgc) {
                $e .= $1;
                push @delimiter, $2;
                $quote_type{$2} = 'qq';
            }

            # other any character
            elsif (/\G (.+?) (?: (?= << ) | $) /xmsgc) {
                local $_ = $1;
                $e .= &escape;
            }
        }

        # find every document
        my %delimiter = ();
        my $script = substr($_, pos($_));
        for my $delimiter (@delimiter) {
            if ($script =~ /\A (.*? \n $delimiter \n) /xms) {
                $delimiter{length($1)} = $delimiter;
            }
            else {
                die "esjis: here document delimiter $delimiter not found.\n";
            }
        }

        # output every here document
        for my $length (sort {$a <=> $b} keys %delimiter) {
            my @longer = grep {$_ >= $length} keys %delimiter;
            if (grep /^qq$/, map { $quote_type{$delimiter{$_}} } @longer) {
                my $delimiter = $delimiter{$length};
                if (/\G (.*?) (\n $delimiter \n)/xmsgc) {
                    $e .= &e_heredoc($1);
                    $e .= $2;
                }
            }
            else {
                my $delimiter = $delimiter{$length};
                if (/\G (.*?) (\n $delimiter \n)/xmsgc) {
                    $e .= $1;
                    $e .= $2;
                }
            }
        }
        return $e;
    }

    # other any character
    elsif (/\G ($q_char) /xgc) { return $1; }

    # system error
    else {
        die "esjis: Can't rewrite script $0";
    }
}

#
# escape q string (q//, '')
#
sub e_q {
    my($ope,$delimiter,$end_delimiter,$string) = @_;

    my @char = $string =~ m/ \G ([\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char-1; $i++) {
        if (($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
            (($char[$i+1] eq '\\') or ($char[$i+1] eq $end_delimiter))
        ) {
            $char[$i] .= '\\';
        }
    }

    return join '', $ope, $delimiter, @char, $end_delimiter;
}

#
# escape qq string (qq//, "")
#
sub e_qq {
    my($ope,$delimiter,$end_delimiter,$string) = @_;

    my $metachar = {
        'qq' => qr/[@\\]/xms,
    }->{$ope} || die "esjis: system error (e_qq)";

    # escape character
    my $left_e  = 0;
    my $right_e = 0;
    my @char = $string =~ m/ \G ([\\\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char; $i++) {

        # escape character
        if ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # return string
    if ($left_e > $right_e) {
        return join '', $ope, $delimiter, @char, '>]}' x ($left_e - $right_e), $end_delimiter;
    }
    else {
        return join '', $ope, $delimiter, @char, $end_delimiter;
    }
}

#
# escape qx string (qx//)
#
sub e_qx {
    my($ope,$delimiter,$end_delimiter,$string) = @_;

    my $metachar = {
        'qx' => qr/[@\\|]/xms,
    }->{$ope} || die "esjis: system error (e_qx)";

    # escape character
    my $left_e  = 0;
    my $right_e = 0;
    my @char = $string =~ m/ \G ([\\\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char; $i++) {

        # escape character
        if ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # return string
    if ($left_e > $right_e) {
        return join '', $ope, $delimiter, @char, '>]}' x ($left_e - $right_e), $end_delimiter;
    }
    else {
        return join '', $ope, $delimiter, @char, $end_delimiter;
    }
}

#
# escape here document (<<"HEREDOC", <<HEREDOC, <<`HEREDOC`)
#
sub e_heredoc {
    my($string) = @_;

    my $metachar = qr/[@\\|]/xms; # '|' is for <<`HEREDOC`

    # escape character
    my $left_e  = 0;
    my $right_e = 0;
    my @char = $string =~ m/ \G ([\\\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char; $i++) {

        # escape character
        if ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # return string
    if ($left_e > $right_e) {
        return join '', @char, '>]}' x ($left_e - $right_e);
    }
    else {
        return join '', @char;
    }
}

#
# escape regexp (m//)
#
sub e_m {
    my($ope,$delimiter,$end_delimiter,$string,$option) = @_;

    my $metachar = {
        'm' => qr/[@\\|[\]{]/xms,
    }->{$ope} || die "esjis: system error (e_m)";

    # split regexp
    my @char = $string =~ m{\G(
        \\  [0-7]{2,3}         |
        \\x [0-9A-Fa-f]{2}     |
        \\x \{ [0-9A-Fa-f]+ \} |
        \\c [\x40-\x5F]        |
        \\  (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) |
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    my $left_e  = 0;
    my $right_e = 0;
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                               $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/xms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for my $char (@charlist) {

                        # do not use quotemeta here
                        if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                            $char = $1.'\\'.$2;
                        }
                        elsif ($char =~ m/\A [.|)] \z/xms) {
                            $char = '\\' . $char;
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # unescape for join separated double octet
        #                              $    (    )    *    +    .    ?    [   \   ^   {   |
        elsif ($char[$i] =~ m/\A \\ (?:0?44|0?50|0?51|0?52|0?53|0?56|0?77|133|134|136|173|174) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        #                               $  (  )  *  +  .  ?  [  \  ^  {  |
        elsif ($char[$i] =~ m/\A \\x (?:24|28|29|2A|2B|2E|3F|5B|5C|5E|7B|7C) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]+) \} \z/xms) {
            my $hex = (length($1) % 2) ? ('0' . $1) : $1;
            $char[$i] = CORE::quotemeta pack('H*',$hex);
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }

        # /i option
        if ($option =~ /i/) {
            if ($char[$i] =~ /^[$@]/) {
                die "esjis: Can't use regexp /i option with variable interpolation. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
            elsif ($char[$i] =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # join separated double octet
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            if ($i < $#char) {
                $char[$i] .= $char[$i+1];
                splice(@char,$i+1,1);
            }
        }

        # escape second octet of double octet
        if ($char[$i] =~ m/\A \\? ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # unescape double octet
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{1,2} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    # make regexp string
    my $re;
    if ($left_e > $right_e) {
        $re = join '', $ope, $delimiter, $chargap, @char, '>]}' x ($left_e - $right_e), $end_delimiter;
    }
    else {
        $re = join '', $ope, $delimiter, $chargap, @char, $end_delimiter, $option;
    }

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# escape regexp (m'')
#
sub e_m_q {
    my($ope,$delimiter,$end_delimiter,$string,$option) = @_;

    # split regexp
    my @char = $string =~ m{\G(
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for (my $i=0; $i <= $#charlist-1; $i++) {

                            # do not use quotemeta here
                            if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                                (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                            ) {
                                $charlist[$i] .= '\\';
                            }
                            elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                                $charlist[$i] = '\\' . $charlist[$i];
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for (my $i=0; $i <= $#charlist-1; $i++) {

                        # do not use quotemeta here
                        if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                            (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                        ) {
                            $charlist[$i] .= '\\';
                        }
                        elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                            $charlist[$i] = '\\' . $charlist[$i];
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # /i option
        if ($option =~ /i/) {
            if ($char[$i] =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape second octet of double octet
        if (($i <= $#char-1) and
            ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
            (($char[$i+1] eq '\\') or ($char[$i+1] eq $end_delimiter))
        ) {
            $char[$i] .= '\\';
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{1,2} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    my $re = join '', $ope, $delimiter, $chargap, @char, $end_delimiter, $option;

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# escape regexp (s/here//)
#
sub e_s {
    my($ope,$delimiter,$end_delimiter,$string) = @_;

    my $metachar = {
        's' => qr/[@\\|[\]{]/xms,
    }->{$ope} || die "esjis: system error (e_s)";

    # split regexp
    my @char = $string =~ m{\G(
        \\  [0-7]{1,3}         |
        \\x [0-9A-Fa-f]{2}     |
        \\x \{ [0-9A-Fa-f]+ \} |
        \\c [\x40-\x5F]        |
        \\  (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) |
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    my $left_e  = 0;
    my $right_e = 0;
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                               $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/xms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for my $char (@charlist) {

                        # do not use quotemeta here
                        if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                            $char = $1.'\\'.$2;
                        }
                        elsif ($char =~ m/\A [.|)] \z/xms) {
                            $char = '\\' . $char;
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # unescape for join separated double octet
        #                              $    (    )    *    +    .    ?    [   \   ^   {   |
        elsif ($char[$i] =~ m/\A \\ (?:0?44|0?50|0?51|0?52|0?53|0?56|0?77|133|134|136|173|174) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\ (([0-7])[0-7]{0,2}) \z/xms) {
            if (($2 eq '0') or ($1 >= 40)) {
                $char[$i] = CORE::chr(oct($1));
            }
            else {
                $char[$i] = '\\' . ($1 + 1);
            }
        }
        #                               $  (  )  *  +  .  ?  [  \  ^  {  |
        elsif ($char[$i] =~ m/\A \\x (?:24|28|29|2A|2B|2E|3F|5B|5C|5E|7B|7C) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]+) \} \z/xms) {
            my $hex = (length($1) % 2) ? ('0' . $1) : $1;
            $char[$i] = CORE::quotemeta pack('H*',$hex);
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # join separated double octet
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            if ($i < $#char) {
                $char[$i] .= $char[$i+1];
                splice(@char,$i+1,1);
            }
        }

        # escape second octet of double octet
        if ($char[$i] =~ m/\A \\? ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # unescape double octet
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{1,2} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    # make regexp string
    my $re;
    if ($left_e > $right_e) {
        $re = join '', $ope, $delimiter, q{\\G((?:$q_char)*?)}, @char, '>]}' x ($left_e - $right_e), $end_delimiter;
    }
    else {
        $re = join '', $ope, $delimiter, q{\\G((?:$q_char)*?)}, @char, $end_delimiter;
    }

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# escape regexp (s'here'{})
#
sub e_s_q {
    my($ope,$delimiter,$end_delimiter,$string) = @_;

    # split regexp
    my @char = $string =~ m{\G(
        \\  [0-7]{1,3} |
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for (my $i=0; $i <= $#charlist-1; $i++) {

                            # do not use quotemeta here
                            if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                                (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                            ) {
                                $charlist[$i] .= '\\';
                            }
                            elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                                $charlist[$i] = '\\' . $charlist[$i];
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for (my $i=0; $i <= $#charlist-1; $i++) {

                        # do not use quotemeta here
                        if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                            (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                        ) {
                            $charlist[$i] .= '\\';
                        }
                        elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                            $charlist[$i] = '\\' . $charlist[$i];
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # unescape for join separated double octet
        #                              $    (    )    *    +    .    ?    [   \   ^   {   |
        elsif ($char[$i] =~ m/\A \\ (?:0?44|0?50|0?51|0?52|0?53|0?56|0?77|133|134|136|173|174) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\ (([0-7])[0-7]{0,2}) \z/xms) {
            if (($2 eq '0') or ($1 >= 40)) {
            }
            else {
                $char[$i] = '\\' . ($1 + 1);
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape second octet of double octet
        if (($i <= $#char-1) and
            ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
            (($char[$i+1] eq '\\') or ($char[$i+1] eq $end_delimiter))
        ) {
            $char[$i] .= '\\';
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{1,2} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    my $re = join '', $ope, $delimiter, q{\\G((?:$q_char)*?)}, @char, $end_delimiter;

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# escape string (s//here/)
#
sub e_s_qq {
    my($ope,$delimiter,$end_delimiter,$string,$option,$re) = @_;

    my $metachar = {
        's' => qr/[@\\]/xms,
    }->{$ope} || die "esjis: system error (e_s_qq)";

    # /i option
    if ($option =~ /i/) {
        while ($re =~ m{ \G ([^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) }xmsg) {
            my $char = $1;
            if ($char =~ /^[$@]/) {
                die "esjis: Can't use regexp /i option with variable interpolation. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
            elsif ($char =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }
    }

    # escape character
    my $left_e  = 0;
    my $right_e = 0;
    my @char = $string =~ m/ \G (\$\d+|[\\\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char; $i++) {

        # rewrite $1,$2,$3 ... --> $2,$3,$4 ...
        if ($char[$i] =~ m/\A (\$) ((\d)\d*) \z/xms) {
            if (($3 eq '0') or ($2 >= 40)) {
            }
            else {
                $char[$i] = $1 . ($2 + 1);
            }
        }

        # escape character
        elsif ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # return string
    if ($left_e > $right_e) {
        return join '', $delimiter, @char, '>]}' x ($left_e - $right_e), $end_delimiter, $option;
    }
    else {
        return join '', $delimiter, @char, $end_delimiter, $option;
    }
}

#
# escape q string (s{}'here')
#
sub e_s_q2 {
    my($ope,$delimiter,$end_delimiter,$string,$option,$re) = @_;

    # /i option
    if ($option =~ /i/) {
        while ($re =~ m{ \G ([^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) }xmsg) {
            my $char = $1;
            if ($char =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }
    }

    my @char = $string =~ m/ \G ([\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC]) /xmsg;
    for (my $i=0; $i <= $#char-1; $i++) {
        if (($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
            (($char[$i+1] eq '\\') or ($char[$i+1] eq $end_delimiter))
        ) {
            $char[$i] .= '\\';
        }
    }

    return join '', $ope, $delimiter, @char, $end_delimiter, $option;
}

#
# escape regexp (qr//)
#
sub e_qr {
    my($ope,$delimiter,$end_delimiter,$string,$option) = @_;

    my $metachar = {
        'qr' => qr/[@\\|[\]{]/xms,
    }->{$ope} || die "esjis: system error (e_qr)";

    # split regexp
    my @char = $string =~ m{\G(
        \\  [0-7]{2,3}         |
        \\x [0-9A-Fa-f]{2}     |
        \\x \{ [0-9A-Fa-f]+ \} |
        \\c [\x40-\x5F]        |
        \\  (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) |
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    my $left_e  = 0;
    my $right_e = 0;
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for my $char (@charlist) {

                            # do not use quotemeta here
                            if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                               $char = $1.'\\'.$2;
                            }
                            elsif ($char =~ m/\A [.|)] \z/xms) {
                                $char = '\\' . $char;
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for my $char (@charlist) {

                        # do not use quotemeta here
                        if ($char =~ m/\A ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
                            $char = $1.'\\'.$2;
                        }
                        elsif ($char =~ m/\A [.|)] \z/xms) {
                            $char = '\\' . $char;
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # unescape for join separated double octet
        #                              $    (    )    *    +    .    ?    [   \   ^   {   |
        elsif ($char[$i] =~ m/\A \\ (?:0?44|0?50|0?51|0?52|0?53|0?56|0?77|133|134|136|173|174) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        #                               $  (  )  *  +  .  ?  [  \  ^  {  |
        elsif ($char[$i] =~ m/\A \\x (?:24|28|29|2A|2B|2E|3F|5B|5C|5E|7B|7C) \z/xms) {
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]+) \} \z/xms) {
            my $hex = (length($1) % 2) ? ('0' . $1) : $1;
            $char[$i] = CORE::quotemeta pack('H*',$hex);
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }

        # /i option
        if ($option =~ /i/) {
            if ($char[$i] =~ /^[$@]/) {
                die "esjis: Can't use regexp /i option with variable interpolation. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
            elsif ($char[$i] =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }

        # \L \U \Q \E
        elsif ($char[$i] =~ m/\A ([<>]) \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '\\' . $char[$i];
            }
        }
        elsif ($char[$i] =~ m/\A \\L \z/xms) {
            $char[$i] = '@{[Sjis::lc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\U \z/xms) {
            $char[$i] = '@{[Sjis::uc qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\Q \z/xms) {
            $char[$i] = '@{[CORE::quotemeta qq<';
            $left_e++;
        }
        elsif ($char[$i] =~ m/\A \\E \z/xms) {
            if ($right_e < $left_e) {
                $char[$i] = '>]}';
                $right_e++;
            }
            else {
                $char[$i] = '';
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # join separated double octet
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            if ($i < $#char) {
                $char[$i] .= $char[$i+1];
                splice(@char,$i+1,1);
            }
        }

        # escape second octet of double octet
        if ($char[$i] =~ m/\A \\? ([\x81-\x9F\xE0-\xFC]) ($metachar|\Q$delimiter\E|\Q$end_delimiter\E) \z/xms) {
            $char[$i] = $1.'\\'.$2;
        }

        # unescape double octet
        elsif ($char[$i] =~ m/\A \\ ([\x81-\x9F\xE0-\xFC][\x00-\xFF]) \z/xms) {
            $char[$i] = $1;
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] | \\[0-7]{2,3} | \\x[0-9A-Fa-f]{1,2} ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    # make regexp string
    my $re;
    if ($left_e > $right_e) {
        $re = join '', $ope, $delimiter, $chargap, @char, '>]}' x ($left_e - $right_e), $end_delimiter;
    }
    else {
        $re = join '', $ope, $delimiter, $chargap, @char, $end_delimiter, $option;
    }

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# escape regexp (qr'')
#
sub e_qr_q {
    my($ope,$delimiter,$end_delimiter,$string,$option) = @_;

    # split regexp
    my @char = $string =~ m{\G(
        \[\^ |
            (?:[^\\\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?)
    )}xmsg;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # open character class [...]
        if ($char[$i] eq '[') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_qr(@char[$left+1..$right-1]);

                    # replace character class if double octet code
                    if (grep m/[\x81-\x9F\xE0-\xFC]/xms, @charlist) {

                        # escape character
                        for (my $i=0; $i <= $#charlist-1; $i++) {

                            # do not use quotemeta here
                            if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                                (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                            ) {
                                $charlist[$i] .= '\\';
                            }
                            elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                                $charlist[$i] = '\\' . $charlist[$i];
                            }
                        }

                        # [...]
                        splice(@char, $left, $right-$left+1,
                            '(?:' . join('|', @charlist) . ')'
                        );

                        $i = $left;
                    }
                    else {
                        $i = $right;
                    }
                    last;
                }
            }
        }

        # open character class [^...]
        elsif ($char[$i] eq '[^') {
            my $left = $i;
            while (1) {
                if (++$i > $#char) {
                    die "esjis: " . join('',@char[$left..$#char]) . " unmatched [] in regexp";
                }
                if ($char[$i] eq ']') {
                    my $right = $i;
                    my @charlist = &charlist_not_qr(@char[$left+1..$right-1]);

                    # escape character
                    for (my $i=0; $i <= $#charlist-1; $i++) {

                        # do not use quotemeta here
                        if (($charlist[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
                            (($charlist[$i+1] eq '\\') or ($charlist[$i+1] eq $end_delimiter))
                        ) {
                            $charlist[$i] .= '\\';
                        }
                        elsif ($charlist[$i] =~ m/\A [.|)] \z/xms) {
                            $charlist[$i] = '\\' . $charlist[$i];
                        }
                    }

                    # [^...]
                    splice(@char, $left, $right-$left+1,
                        '(?!' . join('|', @charlist) . ')(?:[^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF])'
                    );

                    $i = $left;
                    last;
                }
            }
        }

        # replace character class or escape character
        elsif (
my $char = {

'.'  => "(?:[^\x81-\x9F\xE0-\xFC]|[\x00-\xFF][\x00-\xFF])",
'\d' => "[0-9]",
'\w' => "[a-zA-Z_0-9]",
'\s' => "[\x20\t\n\r\f]",
'\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
'\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
'\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",

# do not add below
# '\0' => "\0",
# '\n' => "\n",
# '\r' => "\r",
# '\t' => "\t",
# '\f' => "\f",
# '\b' => "\b",
# '\a' => "\a",
# '\e' => "\e",

}->{$char[$i]}
        ) {
            $char[$i] = $char;
        }

        # /i option
        if ($option =~ /i/) {
            if ($char[$i] =~ /^[\x81-\x9F\xE0-\xFC]/) {
                die "esjis: Can't use regexp /i option with double octet code. Use (?i:xxx) or \\L xxx \E to only alphabet.";
            }
        }
    }

    # characterize
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape second octet of double octet
        if (($i <= $#char-1) and
            ($char[$i] =~ m/\A ([\x81-\x9F\xE0-\xFC]) \\ \z/xms) and
            (($char[$i+1] eq '\\') or ($char[$i+1] eq $end_delimiter))
        ) {
            $char[$i] .= '\\';
        }

        # quote double octet character before ? + * {
        elsif (
            ($i >= 1) and
            ($char[$i] =~ m/\A [\?\+\*\{] \z/xms) and
            ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] (?: \\?[\x00-\xFF] ) \z/xms)
        ) {
            $char[$i-1] = '(?:' . $char[$i-1] . ')';
        }
    }

    my $re = join '', $ope, $delimiter, $chargap, @char, $end_delimiter, $option;

    # return ShiftJIS regexp string
    if (not defined(USE_REGEXP_EVAL) or (USE_REGEXP_EVAL == 0)) {

        #               (?{         (??{          (?p{
        if ($re =~ m/ ( \(\s*\?\{ | \(\s*\?\?\{ | \(\s*\?p\{ ) /xms) {
            die "esjis: $1 in regexp without 'use constant USE_REGEXP_EVAL => 1'";
        }
    }
    return $re;
}

#
# ShiftJIS open character list for qr
#
sub charlist_qr(@) {
    my(@char) = @_;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape - to ...
        if ($char[$i] eq '-') {
            if ((0 < $i) and ($i < $#char)) {
                $char[$i] = '...';
            }
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/xms) {
            $char[$i] = Sjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbaedDwWsS]) \z/xms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => "\n",
                '\r' => "\r",
                '\t' => "\t",
                '\f' => "\f",
                '\b' => "\b", # \b means backspace in character class
                '\a' => "\a",
                '\e' => "\e",
                '\d' => "[0-9]",
                '\w' => "[a-zA-Z_0-9]",
                '\s' => "[\x20\t\n\r\f]",
                '\D' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])",
                '\W' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])",
                '\S' => "(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])",
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) \z/xms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            $char[$i] .= $char[$i+1];
            splice(@char,$i+1,1);
        }
    }

    # open character list
    for (my $i=$#char-1; $i >= 1; ) {

        # escaped -
        if ($char[$i] eq '...') {
            my @range = ();

            # range of single octet code
            if (
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/xms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin > $end) {
                    die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                else {
                    for my $c ($begin..$end) {
                        push(@range, pack('C',$c));
                    }
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin > $end) {
                    die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                elsif (
my $range = {

"\x81\x40-\x98\x72" => '(?:[\x81-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x81\x40-\xEA\x9E" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x81\x40-\xEA\xA2" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x81\x40-\xEA\xA4" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x81\x40-\xFC\xFC" => '(?:[\x81-\x9F\xE0-\xFC][\x40-\x7E\x80-\xFC])',
"\x82\x4F-\x82\x58" => '(?:\x82[\x4F-\x58])',
"\x82\x60-\x82\x79" => '(?:\x82[\x60-\x79])',
"\x82\x81-\x82\x9A" => '(?:\x82[\x81-\x9A])',
"\x82\x9F-\x82\xF1" => '(?:\x82[\x9F-\xF1])',
"\x83\x40-\x83\x96" => '(?:\x83[\x40-\x7E\x80-\x96])',
"\x83\x9F-\x83\xB6" => '(?:\x83[\x9F-\xB6])',
"\x83\xBF-\x83\xD6" => '(?:\x83[\xBF-\xD6])',
"\x84\x40-\x84\x60" => '(?:\x84[\x40-\x60])',
"\x84\x70-\x84\x91" => '(?:\x84[\x70-\x91])',
"\x84\x9F-\x84\xBE" => '(?:\x84[\x9F-\xBE])',
"\x87\x40-\x87\x53" => '(?:\x87[\x40-\x53])',
"\x87\x40-\x87\x9C" => '(?:\x87[\x40-\x5D\x5F-\x75\x7E\x80-\x9C])',
"\x87\x54-\x87\x5D" => '(?:\x87[\x54-\x5D])',
"\x88\x9F-\x98\x72" => '(?:\x88[\x9F-\xFC]|[\x89-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x88\x9F-\xEA\x9E" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x88\x9F-\xEA\xA2" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x88\x9F-\xEA\xA4" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x98\x9F-\xEA\x9E" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x98\x9F-\xEA\xA2" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x98\x9F-\xEA\xA4" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\xED\x40-\xEE\xFC" => '(?:\xED[\x40-\x7E\x80-\xFC]|\xEE[\x40-\x7E\x80-\xEC\xEF-\xFC])',
"\xFA\x40-\xFC\x4B" => '(?:[\xFA-\xFB][\x40-\x7E\x80-\xFC]|\xFC[\x40-\x4B])',

}->{"$begin-$end"}
                ) {
                    push(@range, $range);
                }
                else {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/xms) {
                            push(@range, $char);
                        }
                    }
                }
            }

            # range error
            else {
                die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
            }

            splice(@char, $i-1, 3, @range);
            $i -= 2;
        }
        else {
            $i -= 1;
        }
    }
    return @char;
}

#
# ShiftJIS open character list for not qr
#
sub charlist_not_qr(@) {
    my(@char) = @_;

    # unescape character
    for (my $i=0; $i <= $#char; $i++) {
        next if not defined $char[$i];

        # escape - to ...
        if ($char[$i] eq '-') {
            if ((0 < $i) and ($i < $#char)) {
                $char[$i] = '...';
            }
        }
        elsif ($char[$i] =~ m/\A \\ ([0-7]{2,3}) \z/xms) {
            $char[$i] = CORE::chr(oct($1));
        }
        elsif ($char[$i] =~ m/\A \\x ([0-9A-Fa-f]{2}) \z/xms) {
            $char[$i] = CORE::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\x \{ ([0-9A-Fa-f]{1,4}) \} \z/xms) {
            $char[$i] = Sjis::chr(hex($1));
        }
        elsif ($char[$i] =~ m/\A \\c ([\x40-\x5F]) \z/xms) {
            $char[$i] = CORE::chr(CORE::ord($1) & 0x1F);
        }
        elsif ($char[$i] =~ m/\A (\\ [0nrtfbaedDwWsS]) \z/xms) {
            $char[$i] = {
                '\0' => "\0",
                '\n' => '\n',
                '\r' => '\r',
                '\t' => '\t',
                '\f' => '\f',
                '\b' => "\b", # \b means backspace in character class
                '\a' => '\a',
                '\e' => '\e',
                '\d' => '[0-9]',
                '\w' => '[a-zA-Z_0-9]',
                '\s' => '[\x20\t\n\r\f]',
                '\D' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC0-9])',
                '\W' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFCa-zA-Z_0-9])',
                '\S' => '(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC\x20\t\n\r\f])',
            }->{$1};
        }
        elsif ($char[$i] =~ m/\A \\ ([^\x81-\x9F\xE0-\xFC] | [\x00-\xFF][\x00-\xFF]?) \z/xms) {
            $char[$i] = $1;
        }
    }

    # join separated double octet
    for (my $i=0; $i <= $#char-1; $i++) {
        if ($char[$i] =~ m/\A [\x81-\x9F\xE0-\xFC] \z/xms) {
            $char[$i] .= $char[$i+1];
            splice(@char,$i+1,1);
        }
    }

    # open character list
    for (my $i=$#char-1; $i >= 1; ) {

        # escaped -
        if ($char[$i] eq '...') {
            my @range = ();

            # unescape character
            for my $char ($char[$i-1], $char[$i+1]) {
                $char = {
                    '\n' => "\n",
                    '\r' => "\r",
                    '\t' => "\t",
                    '\f' => "\f",
                    '\a' => "\a",
                    '\e' => "\e",
                }->{$char} || $char;
            }

            # range of single octet code
            if (
                ($char[$i-1] =~ m/\A [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x00-\xFF] \z/xms)
            ) {
                my $begin = unpack('C',$char[$i-1]);
                my $end   = unpack('C',$char[$i+1]);
                if ($begin > $end) {
                    die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                else {
                    push @range, join('', '[', $char[$i-1], '-', $char[$i+1], ']');
                }
            }

            # range of double octet code
            elsif (
                ($char[$i-1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms) and
                ($char[$i+1] =~ m/\A [\x81-\x9F\xE0-\xFC] [\x00-\xFF] \z/xms)
            ) {
                my($begin1,$begin2) = unpack('CC',$char[$i-1]);
                my($end1,$end2)     = unpack('CC',$char[$i+1]);
                my $begin = $begin1 * 0x100 + $begin2;
                my $end   = $end1   * 0x100 + $end2;
                if ($begin > $end) {
                    die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
                }
                elsif (
my $range = {

"\x81\x40-\x98\x72" => '(?:[\x81-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x81\x40-\xEA\x9E" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x81\x40-\xEA\xA2" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x81\x40-\xEA\xA4" => '(?:[\x81-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x81\x40-\xFC\xFC" => '(?:[\x81-\x9F\xE0-\xFC][\x40-\x7E\x80-\xFC])',
"\x82\x4F-\x82\x58" => '(?:\x82[\x4F-\x58])',
"\x82\x60-\x82\x79" => '(?:\x82[\x60-\x79])',
"\x82\x81-\x82\x9A" => '(?:\x82[\x81-\x9A])',
"\x82\x9F-\x82\xF1" => '(?:\x82[\x9F-\xF1])',
"\x83\x40-\x83\x96" => '(?:\x83[\x40-\x7E\x80-\x96])',
"\x83\x9F-\x83\xB6" => '(?:\x83[\x9F-\xB6])',
"\x83\xBF-\x83\xD6" => '(?:\x83[\xBF-\xD6])',
"\x84\x40-\x84\x60" => '(?:\x84[\x40-\x60])',
"\x84\x70-\x84\x91" => '(?:\x84[\x70-\x91])',
"\x84\x9F-\x84\xBE" => '(?:\x84[\x9F-\xBE])',
"\x87\x40-\x87\x53" => '(?:\x87[\x40-\x53])',
"\x87\x40-\x87\x9C" => '(?:\x87[\x40-\x5D\x5F-\x75\x7E\x80-\x9C])',
"\x87\x54-\x87\x5D" => '(?:\x87[\x54-\x5D])',
"\x88\x9F-\x98\x72" => '(?:\x88[\x9F-\xFC]|[\x89-\x97][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72])',
"\x88\x9F-\xEA\x9E" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x88\x9F-\xEA\xA2" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x88\x9F-\xEA\xA4" => '(?:\x88[\x9F-\xFC]|[\x89-\x97\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\x98[\x40-\x72]|\x98[\x9F-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\x98\x9F-\xEA\x9E" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\x9E])',
"\x98\x9F-\xEA\xA2" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA2])',
"\x98\x9F-\xEA\xA4" => '(?:\x98[\x9F-\xFC]|[\x99-\x9F\xE0-\xE9][\x40-\x7E\x80-\xFC]|\xEA[\x40-\x7E\x80-\xA4])',
"\xED\x40-\xEE\xFC" => '(?:\xED[\x40-\x7E\x80-\xFC]|\xEE[\x40-\x7E\x80-\xEC\xEF-\xFC])',
"\xFA\x40-\xFC\x4B" => '(?:[\xFA-\xFB][\x40-\x7E\x80-\xFC]|\xFC[\x40-\x4B])',

}->{"$begin-$end"}
                ) {
                    push(@range, $range);
                }
                else {
                    for my $cc ($begin..$end) {
                        my $char = pack('CC', int($cc / 0x100), $cc % 0x100);
                        if ($char =~ m/\A [\x81-\x9F\xE0-\xFC] [\x40-\x7E\x80-\xFC] \z/xms) {
                            push(@range, $char);
                        }
                    }
                }
            }

            # range error
            else {
                die 'esjis: /['.$char[$i-1].'-'.$char[$i+1]."]/: invalid [] range in regexp";
            }

            splice(@char, $i-1, 3, @range);
            $i -= 2;
        }
        else {
            $i -= 1;
        }
    }
    return @char;
}

1;

__END__
=pod

=head1 NAME

Esjis - Source code filter to escape ShiftJIS

=head1 SYNOPSIS

  C:\>perl esjis.pl ShiftJIS_script.pl > Escaped_script.pl.e

  ShiftJIS_script.pl  --- script written in ShiftJIS
  Escaped_script.pl.e --- escaped script

=head1 BACKWARD COMPATIBILITY

The ShiftJIS was developed in order to maintain backward compatibility. In general,
the operating systems and the programming language keep old interface.

To maintain backward compatibility is a effective solution still now.

=head1 DESCRIPTION

JPerl is very useful software.

Because it is Perl interpreter who can handle Japanese on the Microsoft Windows.
However, the last version of JPerl is 5.005_03 and is not maintained now.

A lot of persons hope to get new version of JPerl. So I made this software, I had
thought that I wanted to solve the problem.

This software is a source code filter to escape Perl script encoded by ShiftJIS.
It outputs it to STDOUT escaping in the script given from STDIN or command line
parameter. The character code is never converted by escaping the script. Neither
the value of the character nor the length of the character string change even if
it escapes.

This approach is suitable for the following case.

=over 2

=item * To handle raw character string

=item * To handle real length of character string

=item * To don't handle flag and functions not related to programming #'

=item * Unnecessary internationalization programming

=back

This software is still a pre-alpha version for expressing a concept to get <YOUR>
help.

=head1 SOFTWARE COMPOSITION

    jperl55.bat  --- jperl emulator by perl5.5 with esjis.pl and Sjis.pm
    jperl510.bat --- jperl emulator by perl5.10 with esjis.pl and Sjis.pm
    perl510.bat  --- find and run perl5.10 without %PATH% settings
    esjis.pl     --- source code filter to escape ShiftJIS
    Sjis.pm      --- run-time routine

=head1 SOFTWARE COMBINATION

=over 2

=item * COMBINATION.1

    Sjis.pm
    subroutines for ShiftJIS.

=item * COMBINATION.2

    esjis.pl + Sjis.pm
    source code filter to escape ShiftJIS

=item * COMBINATION.3

    jperl55.bat + esjis.pl + Sjis.pm
    jperl emulator by perl5.5 with esjis.pl and Sjis.pm

=item * COMBINATION.4

    jperl510.bat + perl510.bat + esjis.pl + Sjis.pm
    jperl emulator by perl5.10 with esjis.pl and Sjis.pm without %PATH% settings

=back

=head1 JPerl COMPATIBLE FUNCTIONS

The following functions function as much as JPerl.

=over 2

=item * handle double octet string in single quote

=item * handle double octet regexp in single quote

=item * chop

=item * split

=item * substr

=item * index

=item * rindex

=item * lc

=item * uc

=back

=head1 JPerl UPPER COMPATIBLE FUNCTIONS

The following functions are enhanced more than JPerl.

=over 2

=item * handle double octet string in double quote

\x{XXXX} syntax can also be used.

=item * handle double octet regexp in double quote

\x{XXXX} syntax can also be used.

=item * chr

double octet code can also be treated.

=item * ord

double octet code can also be treated.

=item * reverse

double octet code can also be treated in scalar context.

=back

=head1 JPerl NOT COMPATIBLE FUNCTIONS

The following functions are not compatible with JPerl. It is the same as
original Perl. 

=over 2

=item * tr/// or y///

You must use Sjis::trans function.

=item * format

It is the same as the function of original Perl.

=item * -B

It is the same as the function of original Perl.

=item * -T

It is the same as the function of original Perl.

=back

=head1 BUGS AND LIMITATIONS

This software is still a pre-alpha version for expressing a concept.
I write test code from now.

Please test code, patches and report problems to author are welcome.

=over 2

=item * LIMITATION.1

The regular expression's option "/i" of operator m//, s///, qr// and split(//)
can't handle double octet code.

When the second octet of a double octet code is the alphabet, for example
katakana-"A" (\x83\x41: second octet is alphabet-"A"), contrary to expectation,
it will be match also katakana-"Di", because second octet of "Di" is alphabet-"a".
Therefore, when double octet code or a variable is in a regular expression, 
error occurs at compile time, script can't be execute. #'

By describing "(?i)" in inside regular expression, since the range can be
restricted, a problem is partially solvable.

=item * LIMITATION.2

Since tr/// and y/// can't handle double octet code, it can't be used.

Instead it, you have to use function Sjis::trans of Sjis module offers.
When tr/// or y/// is described in script, error occurs at compile time,
script can't be execute. #'
Esjis.pl has no function to rewrite tr/// or y/// to Sjis::trans.

Please this patches to author are very welcome.

=item * LIMITATION.3

When two or more delimiters of here documents are in one line, if any one is
a double quote type(<<"END", <<END or <<`END`), then all here documents were
escaped for double quote type before it.

    ex.1
        print <<'END';
        ============================================================
        Escaped for SINGLE quote document.   --- OK
        ============================================================
        END

    ex.2
        print <<\END;
        ============================================================
        Escaped for SINGLE quote document.   --- OK
        ============================================================
        END

    ex.3
        print <<"END";
        ============================================================
        Escaped for DOUBLE quote document.   --- OK
        ============================================================
        END

    ex.4
        print <<END;
        ============================================================
        Escaped for DOUBLE quote document.   --- OK
        ============================================================
        END

    ex.5
        print <<`END`;
        ============================================================
        Escaped for DOUBLE quote command.   --- OK
        ============================================================
        END

    ex.6
        print <<'END1', <<'END2';
        ============================================================
        Escaped for SINGLE quote document.   --- OK
        ============================================================
        END1
        ============================================================
        Escaped for SINGLE quote document.   --- OK
        ============================================================
        END2

    ex.7
        print <<"END1", <<"END2";
        ============================================================
        Escaped for DOUBLE quote document.   --- OK
        ============================================================
        END1
        ============================================================
        Escaped for DOUBLE quote document.   --- OK
        ============================================================
        END2

    ex.8
        print <<'END1', <<"END2", <<'END3';
        ============================================================
        Escaped for DOUBLE quote document 'END1', "END2", 'END3'.
        'END1' and 'END3' see string rewritten for "END2".
        ============================================================
        END1
        ============================================================
        Escaped for DOUBLE quote document "END2", 'END3'.
        'END3' see string rewritten for "END2".
        ============================================================
        END2
        ============================================================
        Escaped for SINGLE quote document.   --- OK
        ============================================================
        END3

    ex.9
        print <<"END1", <<'END2', "END3";
        ============================================================
        Escaped for DOUBLE quote document "END1", 'END2', "END3".
        'END2' see string rewritten for "END1" and "END3".
        ============================================================
        END1
        ============================================================
        Escaped for DOUBLE quote document 'END2', "END3".
        'END2' see string rewritten for "END3".
        ============================================================
        END2
        ============================================================
        Escaped for DOUBLE quote document.   --- OK
        ============================================================
        END3

=back

=head1 HISTORY

This esjis.pl software first appeared in ActivePerl Build 522 Built under
MSWin32 Compiled at Nov 2 1999 09:52:28

=head1 AUTHOR

INABA Hitoshi E<lt>ina@cpan.orgE<gt>

This project was originated by INABA Hitoshi.
For any questions, use E<lt>ina@cpan.orgE<gt> so we can share
this file.

=head1 LICENSE AND COPYRIGHT

This software is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.

This software is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

=head1 ShiftJIS IN WIKIPEDIA

Shift JIS (2008.02.15 15:02:00 JST). In Wikipedia: The Free Encyclopedia.
Retrieved from
L<http://en.wikipedia.org/wiki/Shift_JIS>

Shift JIS (also SJIS, MIME name Shift_JIS) is a character encoding
for the Japanese language originally developed by a Japanese company
called ASCII Corporation in conjunction with Microsoft and standardized
as JIS X 0208 Appendix 1. It is based on character sets defined within
JIS standards JIS X 0201:1997 (for the single-byte characters) and
JIS X 0208:1997 (for the double byte characters). The lead bytes for
the double byte characters are "shifted" around the 64 halfwidth katakana
characters in the single-byte range 0xA1 to 0xDF. The single-byte
characters 0x00 to 0x7F match the ASCII encoding, except for a yen sign
at 0x5C and an overline at 0x7E in place of the ASCII character set's
backslash and tilde respectively. On the web, 0x5C is still used as the
Perl Script escape character. The single-byte characters from 0xA1 to 0xDF
map to the half-width katakana characters found in JIS X 0201. 

Shift JIS requires an 8-bit medium for transmission. It is fully backwards
compatible with the legacy JIS X 0201 single-byte encoding, meaning it
supports half-width katakana and that any valid JIS X 0201 string is also
a valid Shift JIS string. However Shift JIS only guarantees that the first
byte will be in the upper ASCII range; the value of the second byte can be
either high or low. This makes reliable Shift JIS detection difficult.
On the other hand, the competing 8-bit format EUC-JP, which does not
support single-byte halfwidth katakana, allows for a much cleaner and
direct conversion to and from JIS X 0208 codepoints, as all upper-ASCII
bytes are part of a double-byte character and all lower-ASCII bytes are
part of a single-byte character.

Many different versions of Shift JIS exist. There are two areas for
expansion: Firstly, JIS X 0208 does not fill the whole 94x94 space encoded
for it in Shift JIS, therefore there is room for more characters here ?
these are really extensions to JIS X 0208 rather than to Shift JIS itself.
The most popular extension here is to the Windows-31J (otherwise known as
Code page 932) encoding popularized by Microsoft, although Microsoft
itself does not recognize the Windows-31J name and instead calls that
variation "shift_jis". Secondly, Shift JIS has more encoding space than is
needed for JIS X 0201 and JIS X 0208, and this space can and is used for
yet more characters. The space with lead bytes 0xF5 to 0xF9 is used by
Japanese mobile phone operators for pictographs for use in E-mail, for
example (KDDI goes further and defines hundreds more in the space with
lead bytes 0xF3 and 0xF4).

Beyond even this there have been numerous minor variations made on Shift
JIS, with individual characters here and there altered. Most of these
extensions and variants have no IANA registration, so there is much scope
for confusion if the extensions are used. Microsoft Code Page 932 is
registered separately from Shift JIS.
IBM CCSID 943 has the same extensions as Code Page 932.
As with most code pages and encodings it is recommended that Unicode be
used instead.

=head1 "ShiftJIS" IN THIS SOFTWARE

 The "ShiftJIS" in this software means widely codeset than general
ShiftJIS. This software used two algorithms to handle ShiftJIS.

=over 2

=item * ALGORITHM.1

 When the character is taken out of the octet string, it is necessary to
distinguish a single octet character and the double octet character.
The distinction is done only by first octet.

    Single octet code is:
      0x00-0x80, 0xA0-0xDF and 0xFD-0xFF

    Double octet code is:
      First octet   0x81-0x9F and 0xE0-0xFC
      Second octet  0x00-0xFF (All octet)

    MALFORMED single octet code is:
      0x81-0x9F and 0xE0-0xFC
      * Final octet of string like first octet of double octet code

 So this "ShiftJIS" can handle any code of ShiftJIS based code without
Informix Ascii 'INFORMIX V6 ALS' is triple octet code.
(I'm sorry, Informix Ascii users.)

See also code table:

         Single octet code

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                 Double octet code
            First octet                                     Second octet

   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


    *MALFORMED* Single octet code

Final octet of string like first octet of double octet code

Even if malformed, it is not ignored and not deleted automatically.
For example, Sjis::Chop function returns this octet.

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| 0x81-0x9F
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|M|M|M|M|M|M|M|M|M|M|M|M|M| | | |  0xE0-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


The ShiftJIS list via vendors:
L<http://home.m05.itscom.net/numa/cde/sjis-euc/sjis.html>

 DEC PC                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 DEC WS                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu TrueType font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu FontCity font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi PC                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi WS                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 IBM                            0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC Windows (PC)               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC DOS (PC)                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 SONY NEWS-OS                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Sun Wabi                       0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Unisys PC                      0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 HP Japan Japanese HP-15        0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 AT&T Japan                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Mitsubishi Electric FONTRUNNER 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Concurrent Japan               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Informix ASCII INFORMIX V6 ALS 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC), (0xFD)(0xA1-0xFE)(0xA1-0xFE)
 Oracle Oracle7 (Release 7.1.3) 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x00-0xFF)
 Sybase SQL Server, Open Server 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)

=item * ALGORITHM.2

Against algorithm.1, when the range of the character is specified, only the following
character codes are effective.

    Single octet code is:
      0x00-0x80, 0xA0-0xDF and 0xFD-0xFF

    Double octet code is:
      First octet   0x81-0x9F and 0xE0-0xFC
      Second octet  0x40-0x7E and 0x80-0xFC

For instance, [\x81\x00-\x82\xFF] in script means [\x81\x82][\x40-\x7E\x80-\xFC].

See also code table:

         Single octet code

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                 Double octet code
            First octet                                     Second octet

   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x40-0x7E
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x80-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=back

=head1 SEE ALSO

C<Programming Perl, Third Edition>
By Larry Wall, Tom Christiansen, Jon Orwant
Third Edition  July 2000
Pages: 1104
ISBN 10: 0-596-00027-8 | ISBN 13:9780596000271
L<http://www.oreilly.com/catalog/pperl3/index.html>

C<CJKV Information Processing>
Chinese, Japanese, Korean & Vietnamese Computing
By Ken Lunde
First Edition  January 1999
Pages: 1128
ISBN 10: 1-56592-224-7 | ISBN 13:9781565922242
L<http://www.oreilly.com/catalog/cjkvinfo/index.html>

C<Mastering Regular Expressions, Third Edition>
By Jeffrey E. F. Friedl
Third Edition  August 2006
Pages: 542
ISBN 10: 0-596-52812-4 | ISBN 13:9780596528126
L<http://www.oreilly.com/catalog/regex3/index.html>

=head1 ACKNOWLEDGEMENTS

This software was made, thanks to the following hackers or persons.
Especially this POD was written referring from the Encode module.
I am thankful to all persons.

Rick Yamashita, ShiftJIS
http://furukawablog.spaces.live.com/Blog/cns!1pmWgsL289nm7Shn7cS0jHzA!2225.entry

Larry Wall, Perl
L<http://www.perl.org/>

Kazumasa Utashiro, jcode.pl
L<http://www.srekcah.org/jcode/>

Jeffrey E. F. Friedl, Mastering Regular Expressions
L<http://www.oreilly.com/catalog/regex/index.html>

SADAHIRO Tomoyuki, The right way of using ShiftJIS
L<http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm>

jscripter, For jperl users
L<http://homepage1.nifty.com/kazuf/jperl.html>

Hizumi, Perl5.8/Perl5.10 is not useful on the Windows.
L<http://www.aritia.org/hizumi/perl/perlwin.html>

SUZUKI Norio, Jperl
L<http://homepage2.nifty.com/kipp/perl/jperl/>

Dan Kogai, Encode module
L<http://search.cpan.org/dist/Encode/>

=cut

