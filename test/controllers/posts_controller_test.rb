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

  # test "should create post" do
  #   assert_difference('Post.count') do
  #     post posts_path, params: { post: { author: @post.author, content: @post.content, title: @post.title } }
  #   end

  #   assert_select "title", "Post | #{@base_title}"
  #   assert_redirected_to post_path(Post.last)
  # end

  test "should show post" do
    get post_path(@post)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_path(@post)
    assert_response :success
    assert_select "title", "Edit an Entry | #{@base_title}"
  end

  test "should update post" do
    assert_select "title", "Update an Entry | #{@base_title}"
    patch post_path(@post), params: { post: { author: @post.author, content: @post.content, title: @post.title } }
    assert_redirected_to post_path(@post)
  end

  # test "should destroy post" do
  #   assert_difference('Post.count', -1) do
  #     delete post_path(@post)
  #   end

  #   assert_redirected_to posts_path
  # end
end
