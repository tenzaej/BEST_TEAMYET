post '/questions/:question_id/answer' do
  @answer = Answer.new(question_id: params[:question_id], user_id: current_user.id, content: params[:content])
  if @answer.save
    redirect "/questions/#{params[:question_id]}"
  else
    erb :"questions/#{params[:question_id]}"
  end
end
