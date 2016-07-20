#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

configure do
	set :database, "sqlite3:barbershop.db"
end

#p ActiveRecord::Base.connected?

# Сущность клиента
class Client < ActiveRecord::Base
end

#Сущность парикмахеров
class Barber < ActiveRecord::Base
end

get '/' do
	@barbers = Barber.all
	erb :index
end

get '/contacts' do
  @clients = Client.all
	erb :contacts
end

get '/visit' do
  @barbers = Barber.all
  erb :visit
end

post '/visit' do
  newClient = Client.new
  newClient.name  		= params[:username]
  newClient.phone 		= params[:phone]
  newClient.datestamp = params[:datetime]
  newClient.barber		= params[:barber]
  newClient.color			= params[:color]
  newClient.save
  redirect to ('/')
end
