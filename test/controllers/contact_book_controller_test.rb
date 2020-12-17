require 'test_helper'

class ContactBookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contact_book_index_url
    assert_response :success
  end

end
