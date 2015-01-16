require 'bindata'

require_relative 'stuff/stuff1'
require_relative 'stuff/stuff2'

class Sample1 < BinData::Record
  endian :big

  uint16 :field1
  uint8  :field2
  bit7   :field3
  bit1   :field4 
  choice :stuff, :selection => :field4,
                 :choices => {
                    0 => :stuff1,
                    1 => :stuff2 
                 }
end


