class AddSlugToNewsArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :news_articles, :name, :string
    add_column :news_articles, :slug, :string
    add_index :news_articles, :slug, unique: true
  end
end
