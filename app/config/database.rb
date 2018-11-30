require 'active_record'
database_name = "hash_#{ENV['RACK_ENV']}"
db = URI.parse(ENV['DATABASE_URL'] || "postgres://localhost/#{database_name}")
ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :database => "#{database_name}",
    :encoding => 'utf8'
)
