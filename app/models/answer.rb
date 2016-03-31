class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :comments, as: :commentable

  def answer_vote_count
   vote_val=0
    self.votes.each do |vote|
      vote_val += vote.value
    end
    vote_val
  end

  def best_answer?(best_id)
    self.id == best_id
  end

end
