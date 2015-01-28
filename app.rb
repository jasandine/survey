require 'bundler/setup'
Bundler.require :default

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get '/' do
  erb :index
end

get '/questions/:id' do
  erb :question
end

get '/surveys/:id' do
  erb :survey
end

post '/add_survey' do
  title = params.fetch("title")
  Survey.create(title: title)
  redirect back
end
