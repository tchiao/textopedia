class Text < ActiveRecord::Base
  has_many :collaboratings
  has_many :users, through: :collaboratings

  def authors
    self.users.map {|user| user.name}.join(", ")
  end
end
