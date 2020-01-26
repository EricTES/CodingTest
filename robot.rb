class Robot
  attr_accessor :axes,:axis,:foward,:backward,:direction
  def initialize()
    @axes = Array[0,0]
    @axis = 0
    @foward = 1
    @backward = -1
    @direction=0
  end

  def calculatedistance(commands)
    begin
      for command in commands
        direction = command[0].upcase
        times = command[1]

        case direction
        when "F"
          traverse(@foward * times)
        when "B"
          traverse(@backward * times)
        when "L"
          rotate("L",times)
        when "R"
          rotate("R",times)
        else
          raise 'First character of each command must be F,B,L or R'
        end
      end
    rescue StandardError => e
      puts e.message
    else
      puts @axes[0].abs + @axes[1].abs
    end
  end

  #Set the axes
  def traverse(times)
    @axes[@axis] += times
  end

  #Set the direction facing
  def rotate(rotation,times)

    # Check to see if characters after the first are integers
    if times.match(/^[[:alpha:][:blank:]]+$/)
      raise "Characters after the first can only be integers"
    end

    if rotation == "R"
      @direction = (@direction + times.to_i)%4;
    else
      @direction = (@direction + (3*times.to_i)) % 4;
    end
    @axis = @direction%2==0? 0:1;
    @foward = @direction <= 1? 1:-1;
    @backward = @foward == 1? -1: 1;
  end
end


puts "Enter a line of commands with ',' to seperate them e.g  F1,R5,B2...."
command = gets.chomp().split(",")
#command = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(command)
