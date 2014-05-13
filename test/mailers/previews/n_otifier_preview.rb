# Preview all emails at http://localhost:3000/rails/mailers/n_otifier
class NOtifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/n_otifier/email_author
  def email_author
    NOtifier.email_author
  end

end
