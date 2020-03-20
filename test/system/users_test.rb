require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  test "Signing up" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Email", with: "test1@account.com"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    
    click_on "Sign Up"
  
    assert_text "Account Created"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Signing up doesn't work" do
    visit signup_path
    
    fill_in "Name", with: "Test Account"
    fill_in "Password", with: "secret"
    fill_in "Confirm Password", with: "secret"
    
    click_on "Sign Up"
  
    assert_text "Please fix the errors below."
    assert_selector "nav", text: "Login"
    refute_selector "nav", text: "Logout"
  end
  
  test "Login working" do
    @user = FactoryBot.create :user, email: "test@account.com", password: "secret"
    
    visit login_path
    
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "secret"

    click_on "Login"
  
    assert_text "Logged In"
    assert_selector "nav", text: "Logout"
    refute_selector "nav", text: "Login"
  end
  
  test "Login not working" do
    @user = FactoryBot.create :user, email: "test@account.com", password: "secret"
    
    visit login_path
    
    fill_in "Email", with: "test@account.com"
    fill_in "Password", with: "oops"

    click_on "Login"
  
    assert_text "Invalid"
    assert_selector "nav", text: "Login"
  end
end
