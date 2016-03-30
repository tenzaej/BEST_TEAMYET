class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  belongs_to :user

  def commented_question
    if self.commentable_type == "Question"
      Question.find(self.commentable_id)
    else
      answer = Answer.find(self.commentable_id)
      answer.question
    end
  end
end
