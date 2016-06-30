class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :posts, through: :subscriptions

  validates :email, :first_name, presence: { message: "%{value} is not a valid value" }
  validates :email, uniqueness: true

  before_save :uppercase_name

  scope :has_email, -> { where.not(email: nil) }

  def up_last_name
    self.last_name.humanize
  end

  private

  def uppercase_name
    self.first_name = first_name.humanize
  end
end
