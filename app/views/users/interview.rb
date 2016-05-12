cg = {s1:[48, 56, 100], s2:[2, 4, 6]}


cg.values.each { |x|
 x.length.times { |i| i+=i}

}
cg.values.each {|x| sum =  x.reduce(:+); p sum/x.length}
