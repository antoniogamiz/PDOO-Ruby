# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'ShieldToUI'

module Deepspace
  class ShieldBooster
    def initialize(name, boost, uses)
      @name=name
      @boost=boost
      @uses=uses
    end
    
    def self.newCopy(s)
     new(s.name, s.boost, s.uses)
    end

    attr_reader :boost, :uses
    
    def useIt
      if @uses > 0
        @uses-=1
        @boost
      else
        1.0
      end
    end
    
    def getUIversion
      ShieldToUI.new(self)
    end
    
    def to_s
      "Name: #{@name} Boost: #{@boost} Uses: #{@uses}"
    end
    
  end
end
