require 'bindata'

class Stuff2 < BinData::Record
   endian :big

   uint16 :theres_more
   uint32 :thats_all
end
