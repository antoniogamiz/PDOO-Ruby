# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Dice'
require_relative 'PowerSpaceStation'

module Deepspace
  class BetaPowerEfficientSpaceStation < PowerEfficientSpaceStation
    
    @@EXTRAEFFICIENCY=1.2
    
    def initialize(station)
      super(station)
      @dice=Dice.new
    end
    
    #Override
    def fire
      if dice.extraEfficiency
        @@EXTRAEFFICIENCY*super.fire
      else
        super.fire
      end
    end
  end
end
