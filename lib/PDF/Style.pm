use v6;

module PDF::Style {
    use CSS::Declarations::Units;
    sub pt($_, Numeric :$em = 12, Numeric :$ex = 9) is export(:pt) {
        when Numeric {
            (if $_ {
                    my $units = .?key // 'pt';
                    my $scale = do given $units {
                        when 'em' { $em }
                        when 'ex' { $ex }
                        default { Units.enums{$units} }
                    } or die "unknown units: $units";
                    ($_ / $scale).Num
                }
             else {
                 0
             }) does CSS::Declarations::Units::Keyed["pt"];
        }
        default { Nil }
    }

}