require 'rubygems'
require 'bundler/setup'

require 'sinatra'

get '/' do
  "Hello, World!"
end

get '/hello/:name' do
  "Hello there, #{params[:name]}."
end

get '/form' do
  erb :form
end

post '/form' do
  "You said '#{params[:message]}'"
end

not_found do
  halt 404, 'page not found'
end
