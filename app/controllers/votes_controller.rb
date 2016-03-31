get '/questions/:question_id/upvote' do
  @question = Question.find(params[:question_id])
  if request.xhr?
    new_vote = Vote.new(value: 1, votable_id: params[:question_id], user_id: current_user.id, votable_type: "Question")
    if new_vote.save
      vote = {vote_count: @question.vote_count}
      p vote.to_json
    else
      erb :"/questions/show"
    end
  else
    @question.votes.new(value: 1, votable_id: params[:question_id], user_id: current_user.id, votable_type: "Question")
    if @question.save
      erb :"questions/show"
    else
      redirect "/question/#{params[:question_id]}"
    end
  end
end


get '/questions/:question_id/downvote' do
  @question = Question.find(params[:question_id])
    if request.xhr?
    new_vote = Vote.new(value: -1, votable_id: params[:question_id], user_id: current_user.id, votable_type: "Question")
    if new_vote.save
      vote = {vote_count: @question.vote_count}
      p vote.to_json
    else
      erb :'/questions/show'
    end
  else
    @question.votes.new(value: -1, votable_id: params[:question_id], user_id: current_user.id, votable_type: "Question")
    if @question.save
      erb :"questions/show"
    else
      redirect "/questions/#{params[:question_id]}"
    end
  end
end

get '/questions/:question_id/answers/:answer_id/upvote' do
   @answer = Answer.find(params[:answer_id])
  if request.xhr?
    new_vote = Vote.new(value: 1, votable_id: params[:answer_id], user_id: current_user.id, votable_type: "Answer")
    if new_vote.save
      vote = {vote_count: @answer.answer_vote_count}
      p vote.to_json
    else
      erb :"/questions/show"
    end
  else
    @answer.votes.new(value: 1, votable_id: params[:answer_id], user_id: current_user.id, votable_type: "Answer")
    if @answer.save
      erb :"questions/show"
    else
      redirect "/question/#{params[:question_id]}"
    end
  end
end

get '/questions/:question_id/answers/:answer_id/downvote' do
   @answer = Answer.find(params[:answer_id])
  if request.xhr?
    new_vote = Vote.new(value: -1, votable_id: params[:answer_id], user_id: current_user.id, votable_type: "Answer")
    if new_vote.save
      vote = {vote_count: @answer.answer_vote_count}
      p vote.to_json
    else
      erb :"/questions/show"
    end
  else
    @answer.votes.new(value: -1, votable_id: params[:answer_id], user_id: current_user.id, votable_type: "Answer")
    if @answer.save
      erb :"questions/show"
    else
      redirect "/question/#{params[:question_id]}"
    end
  end
end
