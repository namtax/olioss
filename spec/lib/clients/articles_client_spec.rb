require 'rails_helper'

module Clients
  RSpec.describe ArticlesClient do 
    describe '.get' do 
      subject { described_class.get } 

      context 'successful response' do 
        let(:expected) { file_fixture('articles.json').read }

        it 'returns articles from endpoint' do 
          VCR.use_cassette("get_articles") do 
            expect(subject).to eq(expected)
          end
        end
      end

      context 'invalid response' do 
        let(:expected)  { [] }
        let(:exception) { Net::OpenTimeout }
        before do 
          stub_request(:get, "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json").
          with(
            headers: {
            'Accept'=>'*/*',
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
            'Host'=>'s3-eu-west-1.amazonaws.com',
            'User-Agent'=>'Ruby'
            }).
          to_timeout
        end

        it 'returns empty response' do 
          VCR.turned_off do 
            expect(subject).to eq(expected)
          end
        end

        it 'notifies' do
          VCR.turned_off do 
            expect(Rollbar).to receive(:error).with(kind_of(exception))
            subject
          end
        end
      end
    end
  end
end