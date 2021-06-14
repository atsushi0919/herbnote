class ApplicationMailer < ActionMailer::Base
  # 送信元の表示
  default from: "HerbNote <info@herbnote.jaigotec.com>"
  layout "mailer"
end
