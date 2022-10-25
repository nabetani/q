T={
    L:[1,1,3],
    I:[1,1,1,1],
    T:[7,2],
    O:[3,3],
    S:[1,3,2],
}
def s(n); " "*(n*2); end
puts "%table.tetnames"
puts s(1)+"%tr<"
puts( s(2)+T.keys.map{ |k|
    "<th>#{k}</th>"
}.join )
puts s(1)+"%tr"
T.each{ |k,v|
    puts s(2)+"%td"
    puts s(3)+"%table.tet"
    bmax=v.inject( &:|)
    v.each{ |w|
        puts s(4)+"%tr<"
        puts( s(5)+
        [1,2,4].map{ |b|
            if ( 0!=bmax & b )
                c=0==(b&w) ? 's' : 'f'
                %Q!<td class="#{c}">&nbsp;</td>!
            end
        }.compact.join )
    }
}