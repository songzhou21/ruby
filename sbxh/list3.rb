require 'erb'

template = ERB.new <<-EOF
现在的时间是 <%= Time.now.to_s %>
<% 3.times do |i| %>
    <%= i %>
<% end %>
EOF

puts template.result
