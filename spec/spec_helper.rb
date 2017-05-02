require('rspec')
require('pg')
require('doctor')
require('pry')

DB = PG.connect({:dbname => "drs_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors *;")
    DB.exec("DELETE FROM doctors *;")
  end
end
