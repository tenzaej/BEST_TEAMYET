class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_one :best_answer, class_name: "Answer"
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :content, presence: true

  def answer_count
    self.answers.count
  end

  def vote_count
    vote_val=0
    self.votes.each do |vote|
      vote_val += vote.value
    end
    vote_val
  end

  def time_since_creation
    seconds = Time.now - self.created_at
    minutes = (seconds/60).round
    hours = (minutes/60).round
    days = (hours/24).round

    if days > 0
      "#{days} day(s), #{hours} ago"
    elsif hours > 0
      "#{hours} hours ago"
    elsif minutes > 0
      "#{minutes} minutes ago"
    else
      "#{seconds} seconds ago"
    end
  end

  def best_answer?
    self.best_answer
  end

  def tags?
    self.tags
  end

  def tags_string
    tags=""
    self.tags.each do |tag|
      puts tag.name
      tags << tag.name + ","
      puts tags
    end
    tags + "..."
  end



  # def time_since_creation
  #   ((Time.now - self.created_at) / 3600).round
  # end

end
