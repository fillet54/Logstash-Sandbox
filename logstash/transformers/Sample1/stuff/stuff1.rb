require 'bindata'

class Stuff1 < BinData::Record
   endian :big

   uint16 :just_one
end
