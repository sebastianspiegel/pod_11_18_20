require 'pry'
require 'sqlite3'

DB = {conn: SQLite3::Database.new("db/spells.db")} 
DB[:conn].results_as_hash=true 

require_relative './spell'

Spell.create_table
Pry.start