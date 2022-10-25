#encoding : utf-8
[
    "nil..nil",
    "(nil..nil).to_a rescue $!",
    "$stdin..$stdin",
    "$stdin..$stdout rescue $!",
    "($stdin..$stdin).each{} rescue $!",
    "/1/../1/",
    "(/1/../1/).none? rescue $!",
    "(->{})..(->{})",
    "(->{/a/})..(->{/a/})",
    "((->{})..(->{})).one? rescue $!",
].each{ |s|
    puts( "#{s} # #{eval(s)}" )
}