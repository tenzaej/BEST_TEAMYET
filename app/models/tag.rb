class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :questions, through: :taggings
  # Remember to create a migration!
end
