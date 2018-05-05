require 'erb'
require 'rexml/document'

doc = REXML::Document.new(File.open("config.xml"))

template = ERB.new <<-END
/**
* The Entity bean for <%= name %>
* @ejb:bean name="<%= name %>"
*           display-name="<%= name %>"
*           jndi-name= "ejb/<%= name %>"
*           local-jndi-name="ejb/<%= name %>Local"
**/
public abstract class <%= name %>Bean implements EntityBean {
<% elem.each_element("attributes") {|attr|
      aname = attr.attributes["name"].capitalize
      atype = attr.attributes["type"]%>
      /**
      * @ejb:persistent-field
      * @ejb:interface-method view-type="both"
      **/
      public abstract <%= atype %> get<%= aname %>();
      /**
      * @ejb:interface-method view-type="both"
      **/
      public abstract void set<%= aname %>(<%= atype %> <%= aname.downcase %>);
      <% } %>
}
END

doc.root.each_element("bean") {|elem|
      name = elem.attributes["name" ].capitalize
      open("#{name}Bean.java", "w") {|out|
        out.puts template.result(binding)
      }
}
