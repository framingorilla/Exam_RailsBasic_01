require 'test_helper'
require "application_system_test_case"

class UserTest < ApplicationSystemTestCase
  # switch to display Browser
  driven_by :selenium, using: :headless_chrome
  # driven_by :selenium, using: :chrome

  def setup
    @user = User.create(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "login success with exist user" do
    visit login_url
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    assert_text "Example User"
  end

  test "login failed with not exist user" do
    visit login_url
    fill_in "Email", with: "other_user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
    assert_no_text "Example User"
  end

  test "signup success with valid user" do
    visit signup_url
    fill_in "Name", with: "Another User"
    fill_in "Email", with: "another_user@example.com"
    fill_in "Password", with: "foobar"
    fill_in "Confirmation", with: "foobar"
    click_button "Create my account"
    assert_text "Signup success!"
    assert_text "Another User"
  end

  test "logout success" do
    login
    click_on "Account"
    click_on "Log out"
    assert_text "Log in"
  end

  test "success to visit about page" do
    visit about_url
    assert_text "StaticPages#about"
  end

  def login
    visit login_url
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "foobar"
    click_button "Log in"
  end
end

