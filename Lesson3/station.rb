# Сам сделать не смог, списал чужой код, но даже в нем 
# до конца не разобрался. 


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

  def type_trains(car)
    @trains.count { |train| train.type == car.to_sym }
  end
  # Не смог проверить в irb -- type_trains. Вводил в car и символ, и цифру,

  # и строку, ответ один: 
  # NameError (undefined local variable or method `car' for main:Object)
  #
  #
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
  attr_reader :current_speed, :number, :type, :route, :station, :cars

  #TYPE = [:passenger, :cargo]

  def initialize(number, type, cars)
    @number = number
    @type = type.to_sym
    @cars = cars
    @current_speed = 0
    @route_index = 0
  end

  def set_route(route)
    unless @route.nil?
      current_station.remove_train(self)
    end
    @route_index = 0
    @route = route
    current_station.add_train(self)
  end

  # У меня вопрос по add_train(self) и remove_train(self)
  # Пока есть маршрут текущая станция принимает или отправляет список вагонов,
  # т.е. self относится к классу Tren? И Это список всех вагонов поезда?


  # Не смог проверить в irb -- set_route(route). Я не понял, что вводить в (route)
  # список всех станций? Я пробовал разные варианты, получаю
  # NoMethodError (undefined method `route' for nil:NilClass)

  # В итоге без этого не проверил остальные функции.

  def current_station
    @route.route[@route_index]
  end

  def next_station
    return unless @route
    @route.route[@route_index + 1]
  end

  def prev_station
    return unless @route
    return if @station_index < 1
    @route.route[@route_index - 1]
  end

  def move_forward
    if current_station == @route.route.last
      puts "Вы на конечной станции"
    else
      current_station.remove_train(self)
      route_index += 1
      current_speed.add_train(self)
    end
  end

  def move_back
    if current_station == @route.route.first
      puts "Вы на начальной станции"
    else
      current_station.remove_train(self)
      @route_index -= 1
      current_station.add_train(self)
    end
  end

  def add_car
    return if moving?
    cars += 1
  end

  def remove_car
    return if moving?
    cars -= 1
  end

  def moving?
    self.current_speed != 0
  end

  def speed_up(number)
    @current_speed += number
  end

  def break(number)
    @current_speed -= number if current_speed > 0
  end

  def stop
    @current_speed = 0
  end
end