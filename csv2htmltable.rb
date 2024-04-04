# take a csv file from arguments and print it as a html table with links
# usage: ruby csv2htmltable.rb <csv file>

require 'csv'

puts "<table>"
print_header = true

CSV.foreach(ARGV[0]) do |row|
  puts "<tr>"

  if print_header
    row.each do |cell|
      puts "<th>#{cell}</th>"
    end
    print_header = false
  else
    row.each do |cell|
      if cell =~ /^http/
        puts "<td><a href='#{cell}'>#{cell}</a></td>"
      else
        puts "<td>#{cell}</td>"
      end
    end
  end

  puts "</tr>"
end
