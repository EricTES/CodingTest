class Robot
  attr_accessor :axes,:axis, :foward,:backward,:direction
  def initialize()
    @axes = Array[0,0]
    @axis = 0
    @foward = 1
    @backward = -1
    @direction=0
  end


  def calculatedistance(commands)
    for command in commands
      direction = command[0]
      times = command[1].to_i

      case direction
      when "F"
        traverse(@foward * times)
      when "B"
        traverse(@backward * times)
      when "L"
        rotate(times)
      when "R"
        rotate(times)
      end
    end

    puts @vertical.abs + @horizontal.abs
  end

  def traverse(times)
    @axes[@axis] += times
  end

  def rotate(rotation,times)
    @axis = times%2==0? 0 : 1

    if roation == "R" 
      @direction = (@direction + times)%4;
    else
      @direction = (@direction + (3*times)) % 4;
    end
  end
end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
