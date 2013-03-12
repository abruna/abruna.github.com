#!/usr/bin/env ruby

require 'sqlite3'

db = SQLite3::Database.open("test.db")

sql = <<SQL
CREATE TABLE people (
  name varchar(100),
  email varchar(100),
  type varchar(100)
);
SQL

db.execute(sql)

while true
  print "Name: "
  name = STDIN.gets.strip
  print "Email: "
  email = STDIN.gets.strip
  print "Type: "
  type = STDIN.gets.strip.downcase

  db.execute("insert into people values (?, ?, ?);", name, email, type)
end
