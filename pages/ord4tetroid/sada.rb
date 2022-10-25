T=[
    [ "-", 1, %w(00 00 00 00)],
    [ "L", 8, %w(00 01 02 12)],
    [ "I", 4, %w(00 01 02 03)],
    [ "T", 4, %w(00 01 02 11)],
    [ "O", 3, %w( 00 01 10 11)],
    [ "S", 8, %w( 00 01 11 12)],
    [ "-", 2, %w(00 01 20 21)],
    [ "-", 8, %w(00 11 20 21)],
    [ "-", 1, %w(00 00 00 00)],
    [ "-", 1, %w( 00 01 00 11)],
    [ "-", 2, %w(00 01 01 03)],
    [ "-", 1, %w(00 01 02 04)],
    [ "-", 2, %w(00 10 30 40)],
    [ "-", 1, %w(00 11 20 11)],
    [ "-", 1, %w(00 11 02 00)],
    [ "-", 1, %w(00 01 02 13)],
    [ "-", 1, %w(00 11 21 31)],
    [ "-", 1, %w(00 02 20 22)],
]

def xy(pos)
    pos.map{ |i| i.reverse }
end

def xinv(pos)
    pos.map{ |i| [i[0], 3-i[1]] }
end

def rot(pos)
    xinv(xy(pos))
end

def sada( f )
    srand(1099)
    ix=0
    T.map{ |name, pat, postxt|
        pos0=postxt.map{ |i| i.chars.map{ |c| c.ord-?0.ord}}
        (0...pat).map{ |pn|
            pos = pn<4 ? pos0.dup : xinv(pos0)
            (pn&3).times{ pos=rot(pos)}
            ranges=(0..1).map{ |ix|
                pos.map{ |i| i[ix] }.minmax
            }
            shi = ranges.map{ |i| rand(10-(i[1]-i[0]))-i[0] }
            sam=pos.map{ |i| (0..1).map{ |x| i[x]+shi[x] } }.shuffle.map{ |i| i.join }.join(",")
            # puts %Q!"#{sam}", "#{name}"!
            f%[ix+=1,sam,name]
        }
    }.flatten.join
end
