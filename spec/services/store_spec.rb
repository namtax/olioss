require 'rails_helper'

RSpec.describe Store do
  describe '.run' do
    subject                      { described_class.run(input) }
    let(:input)                  { file_fixture('articles.json').read }
    let(:article_attrs)          { Article.find(3899631).attributes.transform_values{ |v| v.is_a?(ActiveSupport::TimeWithZone) ? v.to_s : v } }
    let(:expected_article_attrs) do 
      {
        "id"=>3899631, 
        "title"=>"Ambipur air freshener plugin",
        "description"=>"Device only but refills are available most places", 
        "donation_description"=>"", 
        "collection_id"=>0, 
        "section"=>"product", 
        "location" => {
            "latitude" => 51.7645,
            "longitude" =>  -3.79131,
            "distance" => 0,
            "town" => "Ystalyfera",
            "country" => "United Kingdom"
        }, 
        "collection_notes"=> "Any time!", 
        "value" => {
            "price" => 0,
            "currency" => "USD",
            "payment_type" => "no_payment_type"
        },
        "status"=>"active", 
        "expiry"=>"2021-04-09 10:49:15 UTC", 
        "reactions" => {
            "likes" => 0,
            "by_user" => false,
            "views" => 18,
            "impressions" => 3571
        },
        "is_owner"=>true, 
        "conversations" => {
            "linked" => 0,
            "request_id" => nil
        },
        "photos" => [
            {
                "uid" => "00gRGrBRDFYrR2j-9SJVYg",
                "files" => {
                    "original" => "https:\/\/cdn.olioex.com\/uploads\/photo\/file\/00gRGrBRDFYrR2j-9SJVYg\/image.jpg",
                    "large" => "https:\/\/cdn.olioex.com\/uploads\/photo\/file\/00gRGrBRDFYrR2j-9SJVYg\/large_image.jpg",
                    "medium" => "https:\/\/cdn.olioex.com\/uploads\/photo\/file\/00gRGrBRDFYrR2j-9SJVYg\/medium_image.jpg",
                    "small" => "https:\/\/cdn.olioex.com\/uploads\/photo\/file\/00gRGrBRDFYrR2j-9SJVYg\/small_image.jpg"
                },
                "dimensions" => {
                    "width" => 720,
                    "height" => 960
                }
            }
        ],
        "user_id"=>8039, 
        "created_at"=>"2020-12-12 10:49:18 UTC", 
        "updated_at"=>"2020-12-12 10:49:18 UTC",
      }
    end

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