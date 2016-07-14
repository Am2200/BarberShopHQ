#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, 'sqlite3:barbershop.db'

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
