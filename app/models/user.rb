class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :subscriptions
  has_many :posts, through: :subscriptions

  validates :email, presence: { message: "%{value} is not a valid value" }
  validates :email, uniqueness: true

  # before_save :uppercase_name

  scope :has_email, -> { where.not(email: nil) }

  def up_last_name
    self.last_name.humanize
  end

  private

  def uppercase_name
    self.first_name = first_name.humanize
  end
end
