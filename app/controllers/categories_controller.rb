class CategoriesController < ApplicationController
  before_action :set_category, only: [:show]
    access all: :all

  def index
    @categories = Category.all

    @news_articles = NewsArticle.all
  end

  def show
    @category = Category.find(params[:id])

    @news_articles = NewsArticle.where(categories_id: @category.id).order("created_at DESC")
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
