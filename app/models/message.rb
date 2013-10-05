class Message < ActiveRecord::Base
  attr_accessible :body, :title

  validates :title, presence: true, length: {maximum: 100}
  validates :body, presence: true
end
