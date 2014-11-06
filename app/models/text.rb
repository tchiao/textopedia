class Text < ActiveRecord::Base
  has_many :users, through: :collaboratings
end
