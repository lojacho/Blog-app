require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET /posts' do
    it 'responds successfully' do
      get '/users/1/posts'
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/users/1/posts'
      expect(response).to render_template(:index)
    end

    it 'displays the correct heading' do
      get '/users/1/posts'
      expect(response.body).to include('Posts')
    end
  end

  describe 'GET /posts/:id' do

    it 'responds successfully' do
      get "/users/1/posts/1"
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get "/users/1/posts/1"
      expect(response).to render_template(:show)
    end

    it 'displays the correct heading' do
      get "/users/1/posts/1"
      expect(response.body).to include('Post')
    end
  end
end
