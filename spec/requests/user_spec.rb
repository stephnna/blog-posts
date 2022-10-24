require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users' } # get(:index)
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'include template content' do
      expect(response.body).to include('Here is a list for users')
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET #id' do
    before(:example) { get '/users/:id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'include template content' do
      expect(response.body).to include('Each User details goes here!')
    end
  end
end
