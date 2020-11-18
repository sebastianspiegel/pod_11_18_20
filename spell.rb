class Spell

    attr_accessor :name
    attr_reader :id 

    def initialize(hash = {})
        hash.each do |key, value|
            # self.class.attr_accessor(key) 
            self.send("#{key}=", value) 
        end
    end

    def self.create_table
       sql = <<-SQL
        CREATE TABLE IF NOT EXISTS spells (id INTEGER PRIMARY KEY, name TEXT);
        SQL
        DB[:conn].execute(sql)
    end

    def save
        sql = "INSERT INTO spells (name) VALUES (?)"
        DB[:conn].execute(sql, self.name) 
        self 
    end
end