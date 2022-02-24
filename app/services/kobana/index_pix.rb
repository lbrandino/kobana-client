# frozen_string_literal: true
module Kobana
  class IndexPix < Base
    def call
      response = self.class.get("/pix")            
      return OpenStruct.new(success?: true, pixs: PixParser.new(response).pixs) if response.success?
      OpenStruct.new({success?: false, errors: request_error(response)})
    end
  end
end