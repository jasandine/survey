require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/questions/:id' do
  @question = Question.find(params.fetch("id"))
  erb :question
end

get '/surveys/:id' do
  @survey = Survey.find(params.fetch("id"))
  erb :survey
end

post '/add_survey' do
  title = params.fetch("title")
  Survey.create(title: title)
  redirect back
end

post '/add_question' do
  text = params.fetch("text")
  survey_id = params.fetch("survey_id")
  Question.create(text: text, survey_id: survey_id)
  redirect back
end

delete '/surveys/:id' do
  Survey.find(params.fetch("id")).destroy
  redirect '/'
end

patch '/surveys/:id' do
  @survey = Survey.find(params.fetch("id"))
  title = params.fetch("title")
  @survey.update(title: title)
  redirect back
end

delete '/questions/:id' do
  question = Question.find(params.fetch("id"))
  survey_id = question.survey_id
  question.destroy
  redirect "/surveys/#{survey_id}"
end

patch '/questions/:id' do
  @survey = Question.find(params.fetch("id"))
  text = params.fetch("text")
  @survey.update(text: text)
  redirect back
end

get '/responses/:id' do
  @response_ = Response.find(params.fetch("id"))
  erb(:response)
end

delete '/responses/:id' do
  response = Response.find(params.fetch("id"))
  question_id = response.question_id
  response.destroy
  redirect "/questions/#{question_id}"
end

patch '/responses/:id' do
  @response_ = Response.find(params.fetch("id"))
  text = params.fetch("text")
  @response_.update(text: text)
  redirect back
end

post '/add_response' do
  text = params.fetch("text")
  question_id = params.fetch("question_id")
  Response.create(text: text, question_id: question_id)
  redirect back
end
