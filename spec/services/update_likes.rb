require 'rails_helper'

RSpec.describe UpdateLikes do 
  subject { described_class.run(article.id) }

  describe '.run' do 
    let(:article) { Article.create(user: user) }
    let(:user)    { User.create }
    
    context 'article has no reactions' do
      it 'increases articles likes' do 
        expect{ subject; article.reload }.to change { article.likes }.by(1)
      end
    end

    context 'article has reactions' do
      let(:reactions) do 
        {
          likes: 12,
          by_user: false,
          views: 18,
          impressions: 3571
        }
      end

      before do 
        article.update(reactions: reactions)
      end

      it 'increases articles likes' do 
        expect{ subject; article.reload }.to change { article.likes }.by(1)
      end
    end
  end
end