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
        rotate("L",times)
      when "R"
        rotate("R",times)
      end
    end

    puts @axes[0].abs + @axes[1].abs
  end

  def traverse(times)
    @axes[@axis] += times
  end

  def rotate(rotation,times)
    if rotation == "R"
      @direction = (@direction + times)%4;
    else
      @direction = (@direction + (3*times)) % 4;
    end

    @axis = @direction%2==0? 0:1;

    @foward = @direction <= 1? 1:-1;
    @backward = @foward == 1? -1: 1;

  end
end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
