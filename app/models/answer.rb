class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def answer_vote_count
    self.votes.count
  end

  def best_answer?(best_id)
    self.id == best_id
  end

end
