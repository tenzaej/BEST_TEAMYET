get '/questions/:id/upvote' do
  @question = Question.find(params[:id])
  if request.xhr?

    new_vote = Vote.new(value: 1, votable_id: params[:id], user_id: current_user.id, votable_type: "Question")
    if new_vote.save
      vote = {vote_count: @question.vote_count}
      p vote.to_json
    else
      erb :"/questions/show"
    end
  else
    @question.votes.new(value: 1, votable_id: params[:id], user_id: current_user.id, votable_type: "Question")
    if @question.save
      erb :"questions/show"
    else
      redirect "/question/#{params[:id]}"
    end
  end
end


get '/questions/:id/downvote' do
  @question = Question.find(params[:id])
    if request.xhr?
    new_vote = Vote.new(value: -1, votable_id: params[:id], user_id: current_user.id, votable_type: "Question")
    if new_vote.save
      vote = {vote_count: @question.vote_count}
      p vote.to_json
    else
      erb :'/questions/show'
    end
  else
    @question.votes.new(value: -1, votable_id: params[:id], user_id: current_user.id, votable_type: "Question")
    if @question.save
      erb :"questions/show"
    else
      redirect "/questions/#{params[:id]}"
    end
  end
end
