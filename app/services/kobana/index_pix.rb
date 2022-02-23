# frozen_string_literal: true
#require "pix"
module Kobana
    class IndexPix < Base
         def call
            response = self.class.get("/pix")
            pix_parsers = PixParser.new(response)
            pix_parsers.pixs
         end
    end
end