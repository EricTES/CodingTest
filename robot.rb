class Robot
  attr_accessor :axes,:axis,
  def initialize()
    @axes = Array[0,0]
    @axis = 0
  end


  def calculatedistance(commands)
    for command in commands
      direction = command[0]
      times = command[1].to_i

      case direction
      when "F"
        traverse(times)
      when "B"
        traverse(times)
      when "L"
        rotate()
      when "R"
        rotate()
      end
    end

    puts @vertical.abs + @horizontal.abs
  end

  def traverse(times)
    @axes[@axis] += times
  end

  def rotate()

  end
end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
