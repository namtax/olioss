# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Article do
  describe 'validation' do 
    context 'when missing required fields' do

      let(:expected) do 
        ["User must exist", "Title can't be blank", "Description can't be blank", "Value can't be blank", "Expiry can't be blank"] 
      end

      it 'returns expected errors' do 
        subject.save
        expect(subject.errors.full_messages).to eq(expected)
      end
    end
  end

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

  describe '#price' do 
    context 'value empty' do
      it 'returns zero' do 
        expect(subject.price).to eq(0)
      end
    end

    context 'value present' do
      let(:value) do 
        {
          price: 20,
          currency: "USD",
          payment_type: "no_payment_type"
        }
      end

      before do 
        subject.value = value
      end

      it 'returns likes' do 
        expect(subject.price).to eq("20 USD")
      end
    end
  end
end