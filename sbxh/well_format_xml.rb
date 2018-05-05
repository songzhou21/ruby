require 'rexml/document'
require 'rexml/streamListener'

class WellFormedChecker
    include REXML::StreamListener
end

filename = ARGV[0]

begin
    REXML::Document.parse_stream(File.open(filename), WellFormedChecker.new)
    printf "%s is well-formed\n", filename
rescue REXML::ParseException => e
    printf "%s:%s", filename, e
end
