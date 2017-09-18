require 'test_helper'

class NewsArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @news_article = news_articles(:one)
  end

  test "should get index" do
    get news_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_news_article_url
    assert_response :success
  end

  test "should create news_article" do
    assert_difference('NewsArticle.count') do
      post news_articles_url, params: { news_article: {  } }
    end

    assert_redirected_to news_article_url(NewsArticle.last)
  end

  test "should show news_article" do
    get news_article_url(@news_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_news_article_url(@news_article)
    assert_response :success
  end

  test "should update news_article" do
    patch news_article_url(@news_article), params: { news_article: {  } }
    assert_redirected_to news_article_url(@news_article)
  end

  test "should destroy news_article" do
    assert_difference('NewsArticle.count', -1) do
      delete news_article_url(@news_article)
    end

    assert_redirected_to news_articles_url
  end
end
