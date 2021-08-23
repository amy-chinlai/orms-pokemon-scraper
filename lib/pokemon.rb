require_relative "../bin/environment.rb"

class Pokemon
    attr_accessor :name, :type, :id, :db
    
    def initialize(id: nil, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end

    def self.find(id, db)
        array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        self.new(id: array[0][0], name: array[0][1], type: array[0][2], db: db)
    end
end
