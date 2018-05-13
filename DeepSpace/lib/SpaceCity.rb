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
    
    #Override
    def fire
      fire_=@base.fire
      for s in @collaborators
        fire_+=s.fire
      end
      fire_
    end
    
    #Override
    def protection
      protection_=@base.protection
      for s in @collaborators
        protection_+=s.protection
      end
      protection_
    end
    
    #Override
    def setLoot(l)
      super
      Transformation::NOTRANSFORM
    end
    
  end
end
