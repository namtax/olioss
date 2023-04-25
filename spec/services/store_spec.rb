# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Store do
  describe '.run' do
    subject                      { described_class.run(input) }
    let(:input)                  { file_fixture('articles.json').read }
    let(:article_attrs)          { Article.find(3899631).attributes.transform_values{ |v| v.is_a?(ActiveSupport::TimeWithZone) ? v.to_s : v } }
    let(:expected_article_attrs) { JSON.load(file_fixture('article_attrs.json').read) }

    context 'articles table empty' do
      it 'persists article to database' do 
        expect{ subject }.to change { Article.count }.by(2)
      end

      it 'pesits articles with correct data' do 
        subject
        expect(article_attrs).to eq(expected_article_attrs)
      end
    end

    context 'articles exists' do
      before do 
        subject
      end

      it 'does not persist article to database' do 
        expect{ subject }.to_not change { Article.count }
      end
    end
  end

  context 'users' do
    subject          { described_class.run(input) }
    let(:input)      { file_fixture('articles.json').read }
    let(:user_attrs) { User.last.attributes.transform_values{ |v| v.is_a?(ActiveSupport::TimeWithZone) ? v.to_s : v } }
    let(:expected_user_attrs) do 
      {
        "id"=>8039,
        "first_name"=>"Lloyd",
        "current_avatar"=>
          {"large"=>"https://cdn.olioex.com/uploads/avatar/file/oZq8DF3dzLEi3Fnf4XxMrg/large_image.jpg",
           "small"=>"https://cdn.olioex.com/uploads/avatar/file/oZq8DF3dzLEi3Fnf4XxMrg/small_image.jpg",
           "original"=>"https://cdn.olioex.com/uploads/avatar/file/oZq8DF3dzLEi3Fnf4XxMrg/image.jpg"},
        "roles"=>["Consumer", "Food Waste Hero", "Volunteer", "Administrator"],
        "location"=>{"latitude"=>51.7645, "longitude"=>-3.79133},
        "rating"=>{"number"=>15, "rating"=>10},
        "verifications"=>[{"method"=>"sms"}, {"method"=>"facebook"}],
      }        
    end

    context 'users table empty' do
      it 'persists users to database' do 
        expect{ subject }.to change { User.count }.by(1)
      end

      it 'pesits users with correct data' do 
        subject
        expect(user_attrs).to include(expected_user_attrs)
      end
    end

    context 'user exists' do
      before do 
        subject
      end

      it 'does not persist user to database' do 
        expect{ subject }.to_not change { User.count }
      end
    end
  end
end