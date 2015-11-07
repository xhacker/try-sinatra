require 'rubygems'
require 'bundler/setup'

require 'sinatra'
require 'sequel'
require 'sqlite3'

DB = Sequel.sqlite('contacts.db')
DB.drop_table :contacts
DB.create_table :contacts do
  primary_key :id
  String :first_name
  String :last_name
  String :email
  String :phone
  String :notes
end

get '/' do
  @contacts = DB[:contacts]
  puts @contacts.count
  erb :index
end

get '/new' do
  erb :new
end

post '/new' do
  contacts = DB[:contacts]
  contacts.insert(
    :first_name => params[:first_name],
    :last_name  => params[:last_name],
    :email      => params[:email],
    :phone      => params[:phone],
    :notes      => params[:notes],
  )
  puts "Contact count: #{contacts.count}"
  redirect to('/')
end

not_found do
  halt 404, 'page not found'
end
