require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'welcome/index'
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", help_path, count: 3
    assert_select "a[href=?]", posts_path, count: 3
    assert_select "a[href=?]", othergems_path, count: 3
  end

  test "faker posts links" do
    get posts_path
    assert_template 'posts/index'
    assert_select "a[href=?]", new_post_path
    assert_select "a[href=?]", root_path, count: 4
    assert_select "a[href=?]", help_path, count: 3
    assert_select "a[href=?]", posts_path, count: 3
    assert_select "a[href=?]", othergems_path, count: 3
  end
end
