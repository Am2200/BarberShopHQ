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
  validates :name, presence: true
  validates :phone, presence: true
  validates :datestamp, presence: true
  validates :color, presence: true
end

#Сущность парикмахеров
class Barber < ActiveRecord::Base
end

before do
  @barbers = Barber.all
end

get '/' do
	erb :index
end

get '/contacts' do
  @clients = Client.all
	erb :contacts
end

get '/visit' do
  erb :visit
end

post '/visit' do
  c = Client.new params[:client]
  if c.save
    erb "<h2>Спасибо, вы записались!</h2>"
  else
    erb "<h2>Ошибка</h2>"
  end
end