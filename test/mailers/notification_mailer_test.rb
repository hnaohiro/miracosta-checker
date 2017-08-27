require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase
  test "push" do
    mail = NotificationMailer.push
    assert_equal "Push", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
