class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :votable, polymorphic: true
  # validates :votable_id, :uniqueness => { :scope => [:user_id, :value] }

end
