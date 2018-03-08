# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class ShieldBooster
    def initialize(name, boost, uses)
      @name=name
      @boost=boost
      @uses=uses
    end
    
    def newCopy(s)
      ShieldBooster(s.name, s.boost, s.uses)
    end

    attr_reader :boost
    attr_reader :uses
    
    def useIt
      if @uses > 0
        @uses-=1
        return @boost
      else
        return 1.0
      end
    end
    
  end
end
