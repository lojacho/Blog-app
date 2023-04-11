require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET /users' do
    it 'responds successfully' do
      get '/users'
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get '/users'
      expect(response).to render_template(:index)
    end

    it 'displays the correct heading' do
      get '/users'
      expect(response.body).to include('Tanjiro Kamado')
    end
  end

  describe 'GET /users/:id' do
    it 'responds successfully' do
      get '/users/1'
      expect(response).to be_successful
    end

    it 'renders the show template' do
      get '/users/1'
      expect(response).to render_template(:show)
    end

    it 'displays the correct heading' do
      get '/users/1'
      expect(response.body).to include('Tanjiro Kamado')
    end
  end
end
