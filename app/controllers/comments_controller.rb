post '/questions/:question_id/comments' do
  @comment = Comment.new(content: params[:content], user_id: current_user.id,  commentable_id: params[:question_id], commentable_type: "Question")
  puts @comment.content
  if @comment.save
    status 200
    if request.xhr?
      erb :'comments/_new_comment', locals: {comment: @comment}, :layout => false
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    erb :"questions/#{params[:question_id]}"
  end
end

post '/questions/:question_id/answers/:answer_id/comment' do
  @comment = Comment.new(content: params[:content], user_id: current_user.id, commentable_id: params[:answer_id], commentable_type: "Answer")

  if @comment.save
    redirect "/questions/#{params[:question_id]}"
  else
    erb :"questions/#{params[:question_id]}"
  end
end
