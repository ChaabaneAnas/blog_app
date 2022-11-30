require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1/posts/1'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('here is posts for a given user')
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/users/1/posts/'
      expect(response).to have_http_status(:success)
      expect(response.body).to include('this where all the posts')
    end
  end
end
