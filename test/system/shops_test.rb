require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  #  Index
  test "index page shows all" do
    user = login_user
    shop1 = FactoryBot.create :shop, user: user
    shop2 = FactoryBot.create :shop, user: user
    

    visit shops_path
  
    assert_text shop1.product_name
    assert_text shop2.product_name
  end
  
  # New and Create
  test "create a new shop" do
    login_user
    visit shops_path
    
    click_on "New Product"
    
    fill_in "Product name", with: "Testing product"
    fill_in "Price", with: "1.0"
    fill_in "Quantity", with: "1"
    fill_in "Information", with: "Test information"
    page.attach_file("Productimage", Rails.root + 'test/support/test_image.jpg', make_visible: true)
    
    click_button "Create New Product"
    
    assert_text "Product Posted."
  end
  
  # Login out
  test "logout user test" do
    visit shops_path
    
    assert_equal page.current_path, shops_path
    assert_selector 'nav', text: "Shops"
    refute_selector 'nav', text: "Manage"
  end
  
  test "login user test" do
    login_user
    visit shops_path
    
    assert_equal page.current_path, shops_path
    assert_selector 'nav', text: "Manage"
    refute_selector 'nav', text: "Shops"
  end
  
  # Update
  test "update" do
    user = login_user
    shop1 = FactoryBot.create :shop, user: user
    visit shops_path
    click_on shop1.product_name
    click_on "Edit"
    click_button "Update"
    
    assert_equal page.current_path, "/shops/1"
    assert_text "Product is updated."
  end
  
  # Destroy
  test "delete product test" do
    user = login_user
    shop1 = FactoryBot.create :shop, user: user
    visit shops_path
    
    click_on shop1.product_name
    click_on "Delete"
    page.driver.browser.switch_to.alert.accept
    
    assert_equal page.current_path, shops_path
    assert_text "Product is deleted."
  end
end
