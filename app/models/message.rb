class Message < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true

  default_scope order: 'messages.created_at DESC'

  def deliver
      User.all.each do |user|
        UserMailer.send_message(user,self).deliver
      end
  end
  handle_asynchronously :deliver
end
