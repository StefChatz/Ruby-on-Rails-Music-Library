require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "should get home" do
    get :home
    assert_response :success

    assert_select 'h1', 'Welcome to my music library'
    assert_select 'p', 'by Stefanos Chatzakis'
  end
  test 'should get contact' do
    get :contact
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'Music Library'

    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'
  end
  test "should post request contact but no email" do
    post :request_contact

    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
  end

  test "should post request contact" do
    post :request_contact,
         name: "Stefanos", email: "sc01396@me.com",
         telephone: "3885391300", message: "Hello"
    assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
    end

  test "should return contact email" do
  mail = ContactMailer.contact_email("stefanos@me.com", "Stefanos Chatzakis",
  "1234567890", @message = "Hello")

  assert_equal ['info@mylibrary.com'], mail.to
  assert_equal ['from@mylibrary.com'], mail.from
  end
end
