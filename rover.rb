$max_x = 0
$max_y = 0

class Rover

  attr_accessor :x_coordinate, :y_coordinate, :direction

  def initialize(x_coordinate, y_coordinate, direction)
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @direction = direction
  end


  def read_instructions(orders)
    orders.each do |instruction|
      if instruction == "L" || instruction == "R"
        turn(instruction)
      else
        move
      end
    end
  end


  def move
    case @direction
      when "N"
        if @y_coordinate + 1 > $max_y
          puts "You're going to fall off the map"
        else
          @y_coordinate += 1
        end
      when "E"
        if @x_coordinate + 1 > $max_x
          puts "You're going to fall off the map"
        else
          @x_coordinate += 1
        end
      when "S"
        if @y_coordinate - 1 < 0
          puts "You're going to fall off the map"
        else
          @y_coordinate -= 1
        end
      when "W"
        if @x_coordinate - 1 < 0
          puts "You're going to fall off the map"
        else
          @x_coordinate -= 1
        end
    end
  end

  def turn(instruction)
    case @direction
      when "N"
        if instruction == "L"
          @direction = "W"
        else
          @direction = "E"
        end
      when "E"
        if instruction == "L"
          @direction = "N"
        else
          @direction = "S"
        end
      when "S"
        if instruction == "L"
          @direction = "E"
        else
          @direction = "W"
        end
      when "W"
        if instruction == "L"
          @direction = "S"
        else "R"
          @direction = "N"
        end
    end

  end

  def output
    puts "Direction: #{@direction}, x_coordinate: #{@x_coordinate}, y_coordinate: #{@y_coordinate}"
  end

end

puts "Tell me the size of the plateau"
plateau_size = gets.gsub(/\s+/,"")
plateau_size = plateau_size.split(//)
$max_x = plateau_size[0].to_i
$max_y = plateau_size[1].to_i

puts "Please tell me the initial position of the rover"
position = gets.gsub(/\s+/,"")
mars = Rover.new(position[0].to_i, position[1].to_i, position[2].upcase)

puts "please insert orders for rover"
orders = gets.gsub(/\s+/,"")
orders = orders.upcase.split(//)
mars.read_instructions(orders)
mars.output
