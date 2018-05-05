require 'rexml/document'
require 'rexml/streamlistener'

doc = REXML::Document.new(File.open("address.xml"))
doc.elements.each("/addressbook/address") do |e|
    puts "#{e.elements["name"].text} - #{e.elements["address"].text}"
end

# add node
address = doc.root.add_element("address")
e = address.add_element("name", {'initial' => 'R'})
e.text = "Ruby association"

e = address.add_element("zipcode")
e.text = "690-0003"

doc.elements.each("/addressbook/address") do |e|
    puts "#{e.elements["name"].text}"
end

# SAX (simple API for XML)
class MyListener
    include REXML::StreamListener
    def tag_start(name, attrs)
        print "tag:", name
        if attrs.size > 0
            print ", ", attrs.inspect
        end
        print "\n"
    end

    def text(content)
        unless content.strip == ""
            print "text: ", content, "\n"
        end
    end
end

filename = ARGV[0]
#REXML::Document.parse_stream(File.open(filename), MyListener.new)

# XPath
puts REXML::XPath.first(doc, "//address"), "\n"
puts REXML::XPath.match(doc, "//name"), "\n"
puts REXML::XPath.match(doc, "//address//name"), "\n"

REXML::XPath.each(doc, "//address[name/@initial='R']") do |e|
    puts e
end
