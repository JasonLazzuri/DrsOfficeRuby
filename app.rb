require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/doctor')
require('./lib/patient')
require('pg')
require('pry')


DB = PG.connect({:dbname => "office"})

get('/') do
  erb(:index)
end

get('/drs_list')do
  @doctors = Doctor.all()
  erb(:drs_list)
end

get('/drs_list/new')do
  erb(:drs_form)
end
