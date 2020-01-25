class Robot
  attr_accessor :axes,:axis, :foward,:backward
  def initialize()
    @axes = Array[0,0]
    @axis = 0
    @foward = 1
    @backward = -1

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

  def rotate(times)
    @axis = times%2==0? 0 : 1
  end
end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
