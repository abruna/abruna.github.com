#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.open("test.db")

db.results_as_hash = true

db.execute ("select * from people;") do |row|
  name = row['name']
  email = row['email']
  type = row['type']

  last_name = name.split(' ').last

  f = File.new("../people/#{type}/_posts/0000-06-06-#{last_name}.md", "w")
  f.puts("---")
  f.puts("name: #{name}")
  f.puts("email: #{email}")
  f.puts("---")
  f.close
end