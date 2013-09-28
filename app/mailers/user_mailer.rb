class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(user)
  	Rails.logger.debug 'welcome_email'
    @user = user
    @url  = signin_url
    attachments['logo.jpg'] = File.read("#{Rails.root.to_s}/app/assets/images/aksts_logo_mail.jpg")
    mail(to: @user.email, subject: t(:welcome_email_subject))
  end

  def password_reset(user)
    Rails.logger.debug 'password_reset'
    @url = edit_password_reset_url(user.password_reset_token)
    @user = user
    mail :to => user.email, subject: t(:password_reset_email_subject)
  end

  def test_email
    Rails.logger.debug 'test_email'
    mail(:to => 'm.klishevich@yandex.ru', :subject => "testing rails")
  end

  def test_email1
  	Rails.logger.debug 'test_email'
  	mail(:to => 'm.klishevich@yandex.ru', :subject => "testing rails", body: "lasfkasf")
  end

end
