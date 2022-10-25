D="46,67,57,47"
def s(x); " "*(2*x+4); end

def heads
    "<td></td>"+(0..9).map{ |i| %Q!<th class="ah">#{i}</th>!}.join
end

def lines(y)
    %Q!<th class="ah">#{y}</th>!+(0..9).map{ |x|
        c=( D.include? [x,y].join ) ? "af" : "ac"
        %Q!<td class="%s">&nbsp;</td>!%c
    }.join
end

