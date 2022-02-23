# frozen_string_literal: true
#require "pix"
module Kobana
    class ShowPix < Base
         def call(id:)
            response = self.class.get("/pix/#{id}")
            return OpenStruct.new(success?: true, pix: Pix.new(response)) if response.success?
            OpenStruct.new({success?: false, errors: request_error(response)})
         end
    end
end