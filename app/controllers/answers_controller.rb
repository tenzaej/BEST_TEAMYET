post '/questions/:question_id/answer' do
  puts params
  @answer = Answer.new(question_id: params[:question_id], user_id: current_user.id, content: params[:content])
  puts @answer.content
  if @answer.save
    status 200
    if request.xhr?
      puts "AJAXXXXX"
      erb :'answers/_new_answer', locals: {answer: @answer}, :layout => false
    else
      redirect "/questions/#{params[:question_id]}"
    end
  else
    erb :"questions/#{params[:question_id]}"
  end
end
