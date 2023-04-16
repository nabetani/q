require "json"
require "date"

def yokohama_rb_remap(n)
  case n.join(".")
  when "103"
    [2019,06,15]
  else
    n
  end
end

def category(fn)
  key = fn.split("/")[-2]
  case key
  when "1"
    [:ord,1]
  when /^ord(\d+)/
    [:ord, $1.to_i]
  when /^orde(\d+)/
    [:ord_e, $1.to_i]
  when /^ordf(\d+)/
    [:ord_f, $1.to_i]
  when /^kawasakirb/
    [:kawasaki_rb, 1]
  when /^yokohamarb/
    nums=key.scan( /\d+/ ).map(&:to_i)
    [:yokohama_rb, yokohama_rb_remap(nums)]
  when /^r(\d+)$/
    [:r, $1.to_i]
  else
    raise "no category for #{fn}"
  end
end

def desc(fn, ix)
  s = File.open( fn, &:read )
  m = %r!<title>([^<]*)</title>!i.match(s)
  if m
    title = m[1]
    match = /(\d{4})\.(\d{1,2})\.(\d{1,2})/.match(title)
    date = match ? Date.new(*[1,2,3].map{ |e| match[e].to_i }) : nil
    example = /参考問題/===title
    { path:fn,
      ix:ix,
      name:title,
      date:date,
      example:example,
    }
  end
end

def collect_indices
  h=Dir.glob( "pages/*/index.html" ).map.with_object({}) do |fn, o|
    cat, ix = category(fn)
    o[cat]||=[]
    o[cat] << desc(fn,ix)
  end

  h.keys.each do |k|
    next if h[k].compact.empty?
    h[k].sort_by{ |a|
      [ a[:ix], a[:date], a[:example] ? 0 : 1 ]
    }
  end
  h
end
