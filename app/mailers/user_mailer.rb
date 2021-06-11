class UserMailer < ApplicationMailer
  def account_activation
    @user = user
    mail to: user.email, subject: "HerbNote アカウントの有効化"
  end

  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
