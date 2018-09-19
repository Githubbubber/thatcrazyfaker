require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "That Crazy Faker"
  end

  test "should get index" do
    get welcome_index_url
    assert_response :success
    assert_select "title", "Home | #{@base_title}"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get othergems" do
    get othergems_url
    assert_response :success
    assert_select "title", "Other Great Gems | #{@base_title}"
  end
end
