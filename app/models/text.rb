class Text < ActiveRecord::Base
  has_many :collaboratings
  has_many :users, through: :collaboratings
  mount_uploader :image, ImageUploader

  def authors
    self.users.map {|user| user.name}.join(", ")
  end
end
