require 'active_record'
if ENV['RACK_ENV'].eql?('development') || ENV['RACK_ENV'].eql?('test')
  database_name = "hash_#{ENV['RACK_ENV']}"
  db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")
  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :database => "#{database_name}",
    :encoding => 'utf8'
  )
else
  ActiveRecord::Base.establish_connection(
    :adapter => 'postgresql',
    :database => 'app-dev',
    :encoding => 'utf8',
    :username => 'user',
    :host => 'localhost',
    :passwod => ENV['MYAPP_DATABASE_PASSWORD']
  )
end