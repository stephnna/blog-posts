require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'include post index template content' do
      expect(response.body).to include('Here are list of posts for a given user')
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET #id' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it 'include show template content' do
      expect(response.body).to include('Here are list of posts for a given user and a given post')
    end
  end
end
