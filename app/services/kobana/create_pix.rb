# frozen_string_literal: true

module Kobana
  class CreatePix < Base

    def initialize(attributes)
      @attributes = attributes
    end

    def call
      response = self.class.post("/pix", body: body)
      return response.body if response.success?

      OpenStruct.new({success?: false, errors: request_error(response)})
    end

    def body
       {
          payer: payer,
          amount: @attributes['amount'],
          pix_account_id: 24,
          expire_at: '2022-03-02T10:03:56-03:00'
        }
    end

    def payer
        {
          document_number:  @attributes['document_number'],
          name: @attributes['name']
        } 
    end

  end
end