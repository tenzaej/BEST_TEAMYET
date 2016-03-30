require 'faker'

User.create(username: "Connor", email: "Connor@gmail.com", password: "12345")
User.create(username: "Mitch", email: "Mitch@hotmail.com", password: "12345")
User.create(username: "Eric", email: "Eric@gmail.com", password: "12345")
User.create(username: "Chris", email: "Chris@gmail.com", password: "12345")


user_id = [1,2,3,4]
20.times do
  Question.create(user_id: user_id.sample, best_answer_id: (1..40).to_a.sample,content: Faker::Hipster.paragraph, title: Faker::Company.catch_phrase)
end

40.times do
  Answer.create(question_id: (1..20).to_a.sample, user_id: (1..4).to_a.sample, content: Faker::Hipster.paragraph)
end

20.times do
  Comment.create(user_id: user_id.sample, commentable_id: (1..20).to_a.sample, commentable_type: "Question", content: Faker::Hacker.say_something_smart)
end

40.times do
  Comment.create(user_id: user_id.sample, commentable_id: (1..40).to_a.sample, commentable_type: "Answer", content: Faker::Hacker.say_something_smart)
end

100.times do
  Vote.create(votable_id: (1..20).to_a.sample, votable_type: "Question", user_id: user_id.sample)
end

100.times do
  Vote.create(votable_id: (1..40).to_a.sample, votable_type: "Answer", user_id: user_id.sample)
end

10.times do
  Tag.create(name: Faker::Hacker.noun)
end

10.times do
  Tagging.create(question_id: (1..20).to_a.sample, tag_id: (1..10).to_a.sample)
end
