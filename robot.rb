class Robot
  attr_accessor :axes,:axis,:foward,:backward,:direction
  def initialize()
    @axes = Array[0,0]
    @axis = 0
    @foward = 1
    @backward = -1
    @direction=0
  end

  #Main method to calculate distance
  def calculatedistance(commands)
    begin
      for command in commands
        direction = command[0].upcase
        distance = command[1,command.length()]

        validate(direction, distance)
        distance = distance.to_i

        case direction
          when "F"
            traverse(@foward * distance)
          when "B"
            traverse(@backward * distance)
          when "L"
            rotate("L",distance)
          when "R"
            rotate("R",distance)
        end
      end
    rescue Exception => e
      puts e.message
    else
      puts @axes[0].abs + @axes[1].abs
    end
  end

  #Set the axes
  def traverse(distance)
    @axes[@axis] += distance
  end

  #Set the direction
  def rotate(rotation,distance)
    if rotation == "R"
      @direction = (@direction + distance)%4;
    else
      @direction = (@direction + (3*distance)) % 4;
    end
    #Adjust axis, foward and backward accordingly
    @axis = @direction%2==0? 0:1;
    @foward = @direction <= 1? 1:-1;
    @backward = @foward == 1? -1: 1;
  end


  def validate(direction,distance)
    #Raise exception if first character is not a letter
    if !(direction == 'F' || direction == 'B' || direction == 'R' || direction == 'L')
      raise 'First character of each command must be F,B,L or R'
    end
    #Raise exception if no distance is specified
    if distance.length() < 1
      raise "Please specify a distance after each command"
    end
    # Raise exception if distance specified are not integers
    if !distance.scan(/\D/).empty?
      raise "No spaces, symbols or letters are allowed after the first character. Only integers."
    end
  end

end


puts "Enter a line of commands and distance with ',' to seperate them e.g  F1,R5,B2...."
command = gets.chomp().split(",")
#command = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(command)
