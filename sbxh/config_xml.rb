require 'rexml/document'
doc = REXML::Document.new(File.open("config.xml"))

doc.root.each_element("bean"){|elem|
  printf "class %s:\n", elem.attributes["name"]
  elem.each_element ("attributes") {|attr|
    printf " %s:%s\n", attr.attributes["name"], attr.attributes["type"]
  }
}
