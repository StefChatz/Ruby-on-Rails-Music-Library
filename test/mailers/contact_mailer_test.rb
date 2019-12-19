require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("stefanos@me.com", "Stefanos Chatzakis",
    "1234567890", @message = "Hello")

    assert_equal ['info@mylibrary.com'], mail.to
    assert_equal ['from@mylibrary.com'], mail.from
    end
end
