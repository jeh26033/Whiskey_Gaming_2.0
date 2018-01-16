require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
  end

  test "should get meta" do
    get static_pages_meta_url
    assert_response :success
  end

  test "should get teams" do
    get static_pages_teams_url
    assert_response :success
  end

  test "should get leaderboards" do
    get static_pages_leaderboards_url
    assert_response :success
  end

  test "should get members" do
    get static_pages_members_url
    assert_response :success
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
  end

end
