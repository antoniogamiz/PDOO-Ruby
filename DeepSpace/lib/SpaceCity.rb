# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'SpaceStation'
require_relative 'Transformation'
module Deepspace
  class SpaceCity < SpaceStation
      
    attr_reader :collaborators
    
    def initialize(base, rest)
      super(base)
      @base=base
      @collaborators=rest
    end
    
    def fire
      fire_=@base.fire
      for i in @collaborators.lenght
        fire_+=@collaborators[i].fire
      end
      fire_
    end
    
    def protection
      protection_=@base.protection
      for i in @collaborators.lenght
        protection_+=@collaborators[i].protection
      end
      protection_
    end
    
    def setLoot(l)
      super
      Transformation::NOTRANSFORM
    end
    
  end
end
