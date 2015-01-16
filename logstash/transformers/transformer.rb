# Doesn't do much but just include all transformers
local = File.dirname(__FILE__)
Dir[local + '/**/*.rb'].each { |f|
  print f + "\n"
}
