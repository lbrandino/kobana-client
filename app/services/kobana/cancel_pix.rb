# frozen_string_literal: true
module Kobana
  class CancelPix < Base
    def call(id:)
      response = self.class.put("/pix/#{id}/cancel")
      return response if response.success?
      OpenStruct.new({success?: false, errors: request_error(response)})
    end
  end
end