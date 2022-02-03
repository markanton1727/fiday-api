require 'rails_helper'

describe Api::V1::PropertiesController do
  describe '#index' do
    it 'response with success', :vcr do
      get(:index)
      expect(response.code).to eq('200')
      match_properties(parsed_body(response.body))
    end

    
    it 'responds with 200 with params page and limit' do
      VCR.use_cassette('Api_V1_PropertiesController/_index/response_with_success'
        ) do
        params = { page: 1, limit: 20 }
        get :index, params: params
        binding.pry
        expect(response.code).to eq('200')
      end
    end
  end

  def match_properties(body)
    expect(body).to have_key('titles')
  end
end