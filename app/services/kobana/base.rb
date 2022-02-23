# frozen_string_literal: true

require_relative "../../../lib/kobana_api/pix_parser"

module Kobana 
  class Base 
      include HTTParty
      base_uri "https://api-sandbox.kobana.com.br/v2/charge"  #ENV.fetch('ML_API_URL')

      headers 'Accept' => 'application/json' 
      headers 'User-Agent' => 'KOBANA Client <grupolpgomes@gmail.com>'
      headers 'Authorization' => 'Bearer 1XPbrJ584Xh_uOJ8PlxIGko9-2fPFdz79eO5Jsdn3Ig'


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