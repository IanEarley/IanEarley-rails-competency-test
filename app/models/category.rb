class Category < ApplicationRecord
  
  has_many :news_articles

  def self.with_articles
    includes(:news_article).where.not(news_article: { id: nil })
  end
end