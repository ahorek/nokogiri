require 'nokogiri'

def roundup(num, nearest = 10)
  num % nearest == 0 ? num : num + nearest - (num % nearest)
end

1000.times do |i|
  response = File.read('xml2.xml')
  response2 = response.dup
  x = Nokogiri::XML.parse(response)
  x.root.content = ''
  140.times do
    x.root.children += Nokogiri::XML.parse(response2).root.children
  end
  puts i
end
puts 'ok!'
