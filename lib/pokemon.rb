require_relative "../bin/environment.rb"

class Pokemon
    attr_accessor :name, :type, :id
    
    def initialize(id: nil, name:, type:)
        @id = id
        @name = name
        @type = type
    end

    def self.save
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
        DB[:conn].execute(sql, self.name, self.type)
        @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

end
