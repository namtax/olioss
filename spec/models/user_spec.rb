# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validation' do 
    context 'when missing required fields' do
      let(:expected) do 
        ["First name can't be blank"]
      end

      it 'returns expected errors' do 
        subject.save
        expect(subject.errors.full_messages).to eq(expected)
      end
    end
  end
end