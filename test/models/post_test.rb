require 'test_helper'

class PostTest < ActiveSupport::TestCase  
  def setup
    @post = Post.new(title: "Example", author: "post example com", content: "title and post example com")
  end

# General tests
  test "should be valid" do
    assert @post.valid?
  end

# Title validations
  test "title should be present" do
    @post.title = "     "
    assert_not @post.valid?
  end
  test "title should not be too long" do
    @post.title = "a" * 51
    assert_not @post.valid?
  end

# Author validations
  test "author should be present" do
    @post.author = "     "
    assert_not @post.valid?
  end
  test "author should not be too long" do
    @post.author = "a" * 244
    assert_not @post.valid?
  end

# Content validations
  test "content should be present" do
    @post.content = "     "
    assert_not @post.valid?
  end
  test "content should not be too long" do
    @post.content = "a" * 51
    assert_not @post.valid?
  end
end
