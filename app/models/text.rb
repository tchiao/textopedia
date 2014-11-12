class Text < ActiveRecord::Base
  has_many :collaboratings
  has_many :users, through: :collaboratings
  mount_uploader :image, ImageUploader
  default_scope { order('created_at DESC') }
  scope :visible_to, -> (user) { user ? all : where(public: true)}

  def authors
    self.users.map {|user| user.name}.sort.join(", ")
  end

end
