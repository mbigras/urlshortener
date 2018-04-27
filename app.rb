require 'sinatra'
require 'json'
require 'securerandom'

DB = 'db.json'

before do
  File.write(DB, '{}') unless File.exist? DB
  @db = JSON.parse File.read DB
end

get '/' do
  @db.to_json
end

get %r{/(\w+)} do |key|
  redirect @db[key]
end

post '/' do
  key = SecureRandom.hex 3
  @db[key] = request.body.read
  File.write DB, JSON.pretty_generate(@db)
  key
end