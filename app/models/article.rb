class Article < ApplicationRecord
  belongs_to :user

  def likes 
    reactions.nil? ? 0 : reactions['likes']
  end
end
