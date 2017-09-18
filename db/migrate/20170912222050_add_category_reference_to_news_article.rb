class AddCategoryReferenceToNewsArticle < ActiveRecord::Migration[5.1]
  def change
    add_reference :news_articles, :categories, foreign_key: true
  end
end
