class Passenger
    attr_reader :name,
                :age
    def initialize(attributes)
        @name = attributes["name"]
        @age = attributes["age"]
        @driver = false
    end

    def adult?
        @age >= 18
    end

    def driver?
        return @driver
    end

    def drive
        @driver = true
    end
end