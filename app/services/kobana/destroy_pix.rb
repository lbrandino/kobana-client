# frozen_string_literal: true
module Kobana
  class DestroyPix < Base
    def call(id:)
      response = self.class.delete("/pix/#{id}")
      return response if response.success?
      OpenStruct.new({success?: false, errors: request_error(response)})
    end
  end
end