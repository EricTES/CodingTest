class Robot
  attr_accessor :vertical,:horizontal,:is_vertical

  def initialize()
    @vertical=0
    @horizontal=0
    @is_vertical=true
  end


  def calculatedistance(commands)

    puts @vertical.abs + @horizontal.abs
  end

end

com = Array["F1","R5","B2","L5","B3"]
Robot.new.calculatedistance(com)
