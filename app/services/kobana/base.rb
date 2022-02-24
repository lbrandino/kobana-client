# frozen_string_literal: true

require_relative "../../../lib/kobana_api/pix_parser"
module Kobana 
  class Base 
    include HTTParty
    base_uri ENV.fetch('KOBANA_API_URL') 

    headers 'Accept' => 'application/json' 
    headers 'User-Agent' => ENV.fetch('KOBANA_USER_AGENT')
    headers 'Authorization' => "Bearer #{ENV.fetch('KOBANA_BEARER')}"

    def request_error(response)
      errors = []  
      response["errors"].each do |error|
        errors << error["detail"].to_s
      end
      errors
    end

    def request_success(response)
      errors = []  
      response["errors"].each do |error|
        errors << error["detail"].to_s
      end
      errors
    end
  end
end