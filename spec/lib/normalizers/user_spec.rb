require 'rails_helper'

module Normalizers 
  RSpec.describe User do 
    subject        { described_class.new(input).to_h }
    let(:input)    { JSON.parse(file_fixture('article.json').read) }
    let(:expected) do 
      {
        id: 8039,
        first_name: "Lloyd",
        current_avatar:  {
            original: "https:\/\/cdn.olioex.com\/uploads\/avatar\/file\/oZq8DF3dzLEi3Fnf4XxMrg\/image.jpg",
            large: "https:\/\/cdn.olioex.com\/uploads\/avatar\/file\/oZq8DF3dzLEi3Fnf4XxMrg\/large_image.jpg",
            small: "https:\/\/cdn.olioex.com\/uploads\/avatar\/file\/oZq8DF3dzLEi3Fnf4XxMrg\/small_image.jpg"
        },
        roles: [
            "Consumer",
            "Food Waste Hero",
            "Volunteer",
            "Administrator"
        ],
        location: {
            latitude: 51.7645,
            longitude: -3.79133
        },
        rating: {
            rating: 10,
            number: 15
        },
        verifications: [
            { method: "sms" },
            { method: "facebook" }
        ]
      }
    end
    
    describe '#to_h' do 
      it 'normalizes input' do
        expect(subject).to eq(expected)
      end
    end    
  end
end

