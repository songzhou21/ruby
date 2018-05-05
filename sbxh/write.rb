data = "hello world\n"
#往当前目录的data 文件里写入
open("./data","w") do |f|
  f.write data
end

#从data 文件中读出
open("./data","r") do |f|
  data = f.read
end
