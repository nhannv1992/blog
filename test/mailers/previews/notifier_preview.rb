# Preview all emails at http://localhost:3000/rails/mailers/notifier
class NotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifier/email_author
  def email_author
    Notifier.email_author
  end

end
