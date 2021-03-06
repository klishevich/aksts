class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  has_one :applic, dependent: :destroy

  before_save { |user| user.email=email.downcase}
  before_save :create_remember_token

  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  def send_password_reset
    self.password_reset_token = SecureRandom.urlsafe_base64
    self.password_reset_sent_at = Time.zone.now
    save!(:validate => false)
    UserMailer.password_reset(self).deliver
  end
  handle_asynchronously :send_password_reset

  def notify_new_user 
    UserMailer.welcome_email(self).deliver
  end
  handle_asynchronously :notify_new_user

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end  
end
