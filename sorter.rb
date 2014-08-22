memberlist = File.open("memberlist.csv")

File.open("memberlist-sorted.csv", "w+") do |f|
  f.write memberlist.readlines.sort.join
end

memberlist.close
