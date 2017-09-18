require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should show category" do
    get category_url(@category)
    assert_response :success
  end

  test "should show articles that match category" do
    get category_url(@category)
    @news_articles.categories_id == @category.id
    assert_response :success
  end
end
