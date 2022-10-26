require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get '/' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end    

    it 'include template content' do
      expect(response.body).to include('Number of posts')
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET #id' do
    before(:example) { get "/users/1" }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'include template content' do
      expect(response.body).to include('Number of posts')
    end
  end
end
