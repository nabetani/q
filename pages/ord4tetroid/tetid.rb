#!ruby
def rot(d)
    [d[1], -d[0]]
end

def count( axs, c, d )
    ( 4.times.inject([d]){ |a,b| 
        a+[rot(a.last)]
    }.map{ |i|
        c.zip(i).map{ |x| x.inject( &:+) }
    } & axs ).count
end

def key( input )
    axs=input.split(",").map{|xy| xy.to_i.divmod(10) }.uniq
    axs.map{ |i|
        count( axs, i, [1,0] )*10+count( axs, i, [1,1] )
    }.sort.join("-")
end

def solve( input )
    case key(input)
    when "10-11-20-21" then "L"
    when "10-10-20-20" then "I"
    when "11-11-12-30" then "T"
    when "21-21-21-21" then "O"
    when "11-11-21-21" then "S"
    else "-"
    end
end

DATA.each{ |line|
    /(?<num>\#\d+)\s+(?<input>[\d,]+)\s+(?<expected>\S)/=~line
    actual=solve(input)
    print "%s %s -> %s"%[num,input,actual]
    print "**EXPECTED** : "+expected unless actual==expected
    puts
}

__END__
#1  55,55,55,55 -
#2  07,17,06,05 L
#3  21,41,31,40 L
#4  62,74,73,72 L
#5  84,94,74,75 L
#6  48,49,57,47 L
#7  69,89,79,68 L
#8  90,82,91,92 L
#9  13,23,03,24 L
#10 24,22,25,23 I
#11 51,41,21,31 I
#12 64,63,62,65 I
#13 49,69,59,79 I
#14 12,10,21,11 T
#15 89,99,79,88 T
#16 32,41,43,42 T
#17 27,16,36,26 T
#18 68,57,58,67 O
#19 72,62,61,71 O
#20 25,24,15,14 O
#21 43,54,53,42 S
#22 95,86,76,85 S
#23 72,73,84,83 S
#24 42,33,32,23 S
#25 66,57,67,58 S
#26 63,73,52,62 S
#27 76,68,77,67 S
#28 12,11,22,01 S
#29 05,26,06,25 -
#30 03,11,13,01 -
#31 11,20,00,21 -
#32 84,95,94,86 -
#33 36,56,45,35 -
#34 41,33,32,43 -
#35 75,94,84,95 -
#36 27,39,28,37 -
#37 45,34,54,35 -
#38 24,36,35,26 -
#39 27,27,27,27 -
#40 55,44,44,45 -
#41 70,73,71,71 -
#42 67,37,47,47 -
#43 43,45,41,42 -
#44 87,57,97,67 -
#45 49,45,46,48 -
#46 63,63,52,72 -
#47 84,86,84,95 -
#48 61,60,62,73 -
#49 59,79,69,48 -
#50 55,57,77,75 -