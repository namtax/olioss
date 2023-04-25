require 'rails_helper'

RSpec.describe ArticlesController do 
  describe '#GET' do 
    it 'returns 200' do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe '#POST articles#update' do 
    let(:params)  { { id: article.id } }
    let(:article) { Article.create(user: user) }
    let(:user)    { User.create }

    it 'returns 200' do
      post :update, params: params, format: :js
      expect(response.status).to eq(200)
    end
  end
end