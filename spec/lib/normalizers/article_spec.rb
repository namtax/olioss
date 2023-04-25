require 'rails_helper'

module Normalizers 
  RSpec.describe Article do 
    subject        { described_class.new(input).to_h }
    let(:input)    { JSON.parse(file_fixture('article.json').read) }
    let(:expected) do 
      {:id=>3899631,
       :title=>"Ambipur air freshener plugin",
       :description=>"Device only but refills are available most places",
       :donation_description=>"",
       :collection_id=>0,
       :section=>"product",
       :location=>{:latitude=>51.7645, :longitude=>-3.79131, :distance=>0, :town=>"Ystalyfera", :country=>"United Kingdom"},
       :collection_notes=>"Any time!",
       :value=>{:price=>0, :currency=>"USD", :payment_type=>"no_payment_type"},
       :status=>"active",
       :expiry=>"2021-04-09T10:49:15.000Z",
       :reactions=>{:likes=>0, :by_user=>false, :views=>18, :impressions=>3571},
       :is_owner=>true,
       :conversations=>{:linked=>0, :request_id=>nil},
       :photos=>
        [{:uid=>"00gRGrBRDFYrR2j-9SJVYg",
          :files=>
           {:original=>"https://cdn.olioex.com/uploads/photo/file/00gRGrBRDFYrR2j-9SJVYg/image.jpg",
            :large=>"https://cdn.olioex.com/uploads/photo/file/00gRGrBRDFYrR2j-9SJVYg/large_image.jpg",
            :medium=>"https://cdn.olioex.com/uploads/photo/file/00gRGrBRDFYrR2j-9SJVYg/medium_image.jpg",
            :small=>"https://cdn.olioex.com/uploads/photo/file/00gRGrBRDFYrR2j-9SJVYg/small_image.jpg"},
          :dimensions=>{:width=>720, :height=>960}}],
       :user_id=>8039,
       :created_at=>"2020-12-12T10:49:18.000Z",
       :updated_at=>"2020-12-12T10:49:18.000Z"}
    end
    
    describe '#to_h' do 
      it 'normalizes input' do
        expect(subject).to eq(expected)
      end
    end    
  end
end

