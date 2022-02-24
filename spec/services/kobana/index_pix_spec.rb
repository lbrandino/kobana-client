# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Kobana::IndexPix, type: :service do
  
  context "when #call" do

    it "returns index", :vcr  do
        response = described_class.new.call
        expect(response.success?).to be true
    end

  end
end