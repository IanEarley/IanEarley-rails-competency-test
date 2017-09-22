class NewsArticlesController < ApplicationController
  before_action :set_scoped_article, only: [:edit, :update, :destroy]
  access all: [:index], user: [:show], editor: :all, admin: [:show, :destroy] 

  # GET /news_articles
  def index
    @news_articles = NewsArticle.order("created_at DESC")

    @category = Category.all

    @images = ['news_image_one.jpg', 'politics.jpg', 'italyworldcup.jpg']
  end

  # GET /news_articles/1
  def show
    @news_article = NewsArticle.find(params[:id])
  end

  # GET /news_articles/new
  def new
    @news_article = NewsArticle.new
  end

  # GET /news_articles/1/edit
  def edit
  end

  # POST /news_articles
  def create
    @news_article = NewsArticle.new(news_article_params)
    @user = current_user
    if @news_article.save
      redirect_to @news_article, notice: 'News article was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /news_articles/1
  def update
    if @news_article.update(news_article_params)
      redirect_to @news_article, notice: 'News article was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /news_articles/1
  def destroy
    @news_article.destroy
    redirect_to news_articles_url, notice: 'News article was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scoped_article
      @news_article = NewsArticle.where(users_id: current_user.id).find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def news_article_params
      params.require(:news_article).permit(:title, :body, :categories_id, :users_id)
    end
end
