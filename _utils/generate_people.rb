#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.open("test.db")

db.results_as_hash = true

files = {}

db.execute ("select * from people;") do |row|
  name = row['name']
  email = row['email']
  type = row['type']

  last_name = name.split(' ').last

  if not files.has_key?(type)
    files[type] = File.new("../_data/#{type}.yml", 'w')
  end

  f = files[type]

  f.puts("- name: #{name}")
  f.puts("  email: #{email}")
  f.puts("  photo: rebecca_1.jpg")
  f.puts('')
end

files.each do |k, v|
  v.close
end
