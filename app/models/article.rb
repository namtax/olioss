class Article < ApplicationRecord
  belongs_to :user
  paginates_per 20

  validates :title, presence: true
  validates :description, presence: true
  validates :value, presence: true
  validates :expiry, presence: true

  def likes 
    reactions.nil? ? 0 : reactions['likes']
  end

  def price
    value.nil? ? 0 : "%s %s" % value.values_at("price", "currency")
  end
end
