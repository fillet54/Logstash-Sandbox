require "logstash/filters/base"
require "logstash/namespace"

class LogStash::Filters::HexDataTransformer < LogStash::Filters::Base
   config_name "hexdatatransformer"
   milestone 1

   config :field, :validate => :string, :required => true

   config :decoder_type, :validate => :string, :required => true

   config :base_dir, :validate => :string

   config :destination, :validate => :string, :default => "decoded"

   config :base, :validate => :number, :default => 16

   public
   def register
      print "Loading Transformer\n"

      if not @base_dir
         @base_dir = File.dirname(File.dirname(File.dirname(File.dirname(__FILE__))))
      end
      
      Dir[File.join(@base_dir, 'transformers', '**/*.rb')].each { |f|
        require f 
      }

      @decoder = class_from_string(@decoder_type)
   end

   public
   def filter(event)
      binary_data = binary_from_string(event[@field], @base)
      event[@destination] = @decoder.read(binary_data)
   end

   private
   def class_from_string(str)
      str.split('::').inject(Object) do |mod, class_name|
         mod.const_get(class_name) 
      end 
   end

   private
   def binary_from_string(str, base)
      str.gsub(/\s+/, "").scan(/../).inject("") do |binary, hn|
         binary << hn.to_i(base).chr
      end
   end
end
