require 'rails_helper'

RSpec.describe Article do 
  describe '#likes' do 
    context 'reactions empty' do
      it 'returns zero' do 
        expect(subject.likes).to eq(0)
      end
    end

    context 'reactions present' do
      let(:reactions) do 
        {
          likes: 12,
          by_user: false,
          views: 18,
          impressions: 3571
        }
      end

      before do 
        subject.reactions = reactions
      end

      it 'returns likes' do 
        expect(subject.likes).to eq(12)
      end
    end
  end
end