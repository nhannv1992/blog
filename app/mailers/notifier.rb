class Notifier < ActionMailer::Base
  default from: "nhannv.nustechnology@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.email_author.subject
  #
  def email_author(comment, post)
    @comment = comment
    @post = post
    @greeting = "Hi"

    mail to: "nhannv.nustechnology@gmail.com", :subject => "Interesting Article"

  end

end
