require 'test_helper'

class NOtifierTest < ActionMailer::TestCase
  test "email_author" do
    mail = NOtifier.email_author
    assert_equal "Email author", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
