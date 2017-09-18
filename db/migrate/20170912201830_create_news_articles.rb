class CreateNewsArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :news_articles do |t|
      t.string :title
      t.text :body
      
      t.timestamps
    end
  end
end
