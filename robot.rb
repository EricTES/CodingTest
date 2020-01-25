class Robot
  attr_accessor :vertical,:horizontal,:is_vertical

  def initialize()
    @vertical=0
    @horizontal=0
    @is_vertical=true
  end


  def calculatedistance(commands)
    for command in commands
      direction = command[0]
      times = command[1].to_i

      case direction
      when "F"
        traverse()
      when "B"
        traverse()
      when "L"
        rotate()
      when "R"
        rotate()
      end
    end

    puts @vertical.abs + @horizontal.abs
  end

  def traverse()
  
  end

  def rotate()

  end
end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
