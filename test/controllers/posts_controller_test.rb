require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @post = posts(:one)
    @base_title = "That Crazy Faker"
  end

  test "should get index" do
    get posts_path
    assert_response :success
    assert_select "title", "Posts | #{@base_title}"
  end

  test "should get new" do
    get new_post_path
    assert_response :success
    assert_select "title", "Make a New Entry | #{@base_title}"
  end

# NEED TO REVISIT
  # test "should create post" do
  #   assert_difference('Post.count') do
  #     # puts @post.title + " " + posts_path
  #     post posts_path, params: { commit: @post.title }
  #   end

  #   assert_select "title", "Post | #{@base_title}"
  #   assert_redirected_to post_path(Post.last)
  # end

  test "should show post" do
    get post_path(@post)
    assert_response :success
  end
end
