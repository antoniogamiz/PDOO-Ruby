# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'SpaceStation'
require_relative 'Transformation'
require_relative 'PowerEfficientSpaceStationToUI'

module Deepspace
  class PowerEfficientSpaceStation < SpaceStation
    @@EFFICIENCYFACTOR=1.1
    
    def initialize(station)
      super(station)
    end
    
    #Override
    def fire
      super*@EFFICIENCYFACTOR
    end
    
    #Override
    def proection
      super*@EFFICIENCYFACTOR
    end
    
    #Override
    def setLoot(l)
      super
      Transformation::NOTRANSFORM
    end
    
    def getUIversion
      PowerEfficientSpaceStationToUI.new(self)
    end
  end
end
