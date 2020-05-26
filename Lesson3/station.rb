 
class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
  end

  def remove_train(train)
    self.trains.delete(train)
  end

  def type_trains(type)
    @trains.count { |train| train.type == type.to_sym }
  end
end

class Route
  attr_reader :first_station, :last_station, :inter_stations

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @inter_stations = []
  end

  def route
    [@first_station, @inter_stations, @last_station].flatten.compact
  end

  def add_station(station)
    self.inter_stations << station
  end

  def remove_station(station)
    self.inter_stations.delete(station)
  end
end

class Train
  attr_reader :speed, :wagons, :type

  def initialize(number, type, wagons)
    @number = number
    @type = type.to_sym
    @wagons = wagons
    @speed = 0
    @route = nil
    @station_index = nil
  end

  def set_route(r)
    @station_index = 0
    @route = r
    current_station.add_train(self)
  end

  def current_station
    @route.route[@station_index]
  end

  def next_station
    return unless @route
    @route.route[@station_index + 1]
  end

  def prev_station
    return unless @route
    return if @station_index < 1
    @route.route[@station_index - 1]
  end

  def move_forward
    return unless @route && next_station
    current_station.remove_train(self)
    @station_index += 1
    current_station.add_train(self)
  end

  def move_back
    return unless @route && prev_station
    current_station.remove_train(self)
    @station_index -= 1
    current_station.add_train(self)
  end

  def add_wagon
    return if moving?
    @wagons += 1
  end

  def remove_wagon
    return if moving?
    @wagons == 0 ? 0 : @wagons =- 1
  end

  def moving?
    self.speed != 0
  end

  def speed_up(number)
    @speed += number
  end

  def break(number)
    @speed -= number if speed > 0
  end

  def stop
    @speed = 0
  end
end



