post '/questions/:question_id/comments' do
  @comment = Comment.new(content: params[:content], user_id: current_user.id,  commentable_id: params[:question_id], commentable_type: "Question")

  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    erb :"/questions/#{params[:question_id]}"
  end
end
