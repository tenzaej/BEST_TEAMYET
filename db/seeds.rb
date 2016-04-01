require 'faker'

User.create(username: "Connor", email: "Connor@gmail.com", password: "12345", image_url: Faker::Avatar.image)
User.create(username: "Mitch", email: "Mitch@hotmail.com", password: "12345", image_url: Faker::Avatar.image)
User.create(username: "Eric", email: "Eric@gmail.com", password: "12345", image_url: Faker::Avatar.image)
User.create(username: "Chris", email: "Chris@gmail.com", password: "12345", image_url: Faker::Avatar.image)
User.create(username: "Karl", email: "Karl@gmail.com", password: "12345", image_url: "http://media.salon.com/2014/04/karl_marx.jpg")
User.create(username: "TuffGong", email: "Bobby@gmail.com", password: "12345", image_url: "https://lh5.googleusercontent.com/-jaNM0BX_1oY/AAAAAAAAAAI/AAAAAAAAWKw/vw1YRbueEJQ/s0-c-k-no-ns/photo.jpg")
user_id = [1,2,3,4]
 Question.create(user_id: 5, best_answer_id: (1..40).to_a.sample,content: "There is still a compulsive quality to its prose as it provides insight after insight into the society in which we live, where it comes from and where its going to. It is still able to explain, as mainstream economists and sociologists cannot, today's world of recurrent wars and repeated economic crisis, of hunger for hundreds of millions on the one hand and 'overproduction' on the other. There are passages that could have come from the most recent writings on globalisation", title: "Communism!")
 Question.create(user_id: 6, best_answer_id: (1..40).to_a.sample, content: "Better to die fighting for freedom then be a prisoner all the days of your life.", title: "Just a thought...")
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
