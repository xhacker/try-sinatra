require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sequel'
require 'sqlite3'

DB = Sequel.sqlite
DB.create_table :contacts do
  primary_key :id
  String :first_name
  String :last_name
  String :email
  String :phone
  String :notes
end

class Contact < Sequel::Model; end

get '/' do
  @contacts = Contact.all
  erb :index
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
