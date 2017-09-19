class NewsArticlesController < ApplicationController
  before_action :set_news_article, only: [:show, :edit, :update, :destroy]
  access all: [:index, :show, :new, :edit, :create, :update, :destroy], 
        guest: {except: [:show, :new, :edit, :create, :update, :destroy]}, 
        user: {except: [:new, :edit, :create, :update, :destroy]},
        editor: :all,
        admin: :all

  # GET /news_articles
  def index
    @news_articles = NewsArticle.order("created_at DESC")

    @category = Category.all

    @images = ['news_image_one.jpg', 'politics.jpg', 'italyworldcup.jpg']
  end

  # GET /news_articles/1
  def show
    if logged_in?(:user) || logged_in?(:editor) || logged_in?(:admin)
      @news_article = NewsArticle.find(params[:id])
    else
      redirect_to new_user_registration_path, notice: "Register now to view this article!"
    end
  end

  # GET /news_articles/new
  def new
    if logged_in?(:editor) || logged_in?(:admin)
      @news_article = NewsArticle.new
    else
      redirect_to new_user_registration_path, notice: "Register now to view this article!"
    end
  end

  # GET /news_articles/1/edit
  def edit
  end

  # POST /news_articles
  def create
    if logged_in?(:editor) || logged_in?(:admin)
      @news_article = NewsArticle.new(news_article_params)

      @user = current_user

      if @news_article.save
        redirect_to @news_article, notice: 'News article was successfully created.'
      else
        render :new
      end
    else
      redirect_to root_path, notice: "You are not authorized to perform this action..."
    end
  end

  # PATCH/PUT /news_articles/1
  def update
    if logged_in?(:editor) || logged_in?(:admin)
      if @news_article.update(news_article_params)
        redirect_to @news_article, notice: 'News article was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to root_path, notice: "You are not authorized to perform this action..."
    end
  end

  # DELETE /news_articles/1
  def destroy
    if logged_in?(:editor) || logged_in?(:admin)
      @news_article.destroy
      redirect_to news_articles_url, notice: 'News article was successfully destroyed.'
    else
      redirect_to root_path, notice: "You are not authorized to perform this action..."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news_article
      @news_article = NewsArticle.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def news_article_params
      params.require(:news_article).permit(:title, :body, :categories_id, :users_id)
    end
end
