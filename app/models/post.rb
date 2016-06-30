class Post < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :title, presence: true
end
