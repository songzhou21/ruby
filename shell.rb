# backtick
## Backtick is a blocking operation

ls = `ls`

puts "output is \n#{ls}"


## return status
puts "ret #{$?.success?}"

## string interpolation
cmd_ls = 'ls -a'

puts `#{cmd_ls}`


# system
## system is a blocking operation

#  Eats up all exceptions
sys_output = system('xxxx')
puts "===system==="
puts "output is #{sys_output}"

puts "=system ret="
puts system("command that does not exist")
puts system("pwd")
puts system("ls | grep xxxxxxxxxxxxx")
