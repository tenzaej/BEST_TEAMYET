class Tagging < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  # Remember to create a migration!
end
