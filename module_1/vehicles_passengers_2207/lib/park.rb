class Park
    attr_reader :name,
                :admission,
                :vehicles
    def initialize(name, admission)
        @name = name
        @admission = admission
        @vehicles = []
    end

    def enter(vehicle)
        @vehicles << vehicle
    end

    def passengers
        arr = @vehicles.map {|vehicle| vehicle.passengers.map {|passenger| passenger.name} }
        new_arr = arr[0] | arr[1]
    end

    def calculate_revenue 
        @vehicles.map {|vehicle| vehicle.passengers.find_all {|passenger| passenger.adult? }.count * @admission}.sum
    end

    def revenue_by_vehicle
        revenue_hash = {}
        @vehicles.map {|vehicle| revenue_hash.store(vehicle, nil)}
    end
end