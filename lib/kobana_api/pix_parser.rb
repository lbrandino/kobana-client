# frozen_string_literal: true

class PixParser
  def initialize(raw_response)
    @raw_response = raw_response 
  end  
  
  def pixs
    @raw_response['data'].map { |attributes| Pix.new(attributes) } 
  end
end