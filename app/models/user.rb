class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :collaboratings
  has_many :texts, through: :collaboratings
  mount_uploader :avatar, AvatarUploader
  validates :name, presence: true

  def premium?
    self.plan == "premium"
  end

end
