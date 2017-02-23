User.destroy_all
Question.destroy_all
Answer.destroy_all

10.times do |i|
  User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password")
	5.times do |t|
  	question = Question.create(question_text: Faker::Lorem.paragraph, user_id: i + 1)
  	question.comments.create(comment_text: Faker::Lorem.sentence, user_id: i + 1)
  	question.votes.create(user_id: i + 1)
  	3.times do 
  		answer = Answer.create(answer_text: Faker::Lorem.sentence, user_id: i + 1, question_id: t + 1)
  		answer.comments.create(comment_text: Faker::Lorem.sentence, user_id: i + 1)
  		answer.votes.create(user_id: i + 1)
  	end
  end 
end



