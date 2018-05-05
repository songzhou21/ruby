require 'mkmf'
if have_library("qdbm") and
have_header("qdbm/depot.h")
  create_makefile("minidb")
end
