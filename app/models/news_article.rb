class NewsArticle < ApplicationRecord
  validates_presence_of :title, :body, :categories_id, :users_id

  # belongs_to :user

  def set_user!(user)
    self.user_id = user.id

    self.save!
  end
end