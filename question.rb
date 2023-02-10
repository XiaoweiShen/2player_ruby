class Question
  attr_accessor :answer,:question
  def initialize
   number_1 = rand(1..20)
   number_2 = rand(1..20)
   operator = rand(1..2)>1? "plus" : "minus"
   @answer = operator=="plus"? number_1 + number_2 : number_1-number_2  
   @question= "What does #{number_1} #{operator} #{number_2} equal?"
  end
end 