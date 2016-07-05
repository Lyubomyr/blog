class Post < ActiveRecord::Base
  has_many :subscriptions
  has_many :users, through: :subscriptions

  validates :title, presence: true
  before_save :big_title

  def big_title
    self.title = title.humanize
  end
end
