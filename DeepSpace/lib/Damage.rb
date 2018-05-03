# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'DamageToUI'

module Deepspace

  class Damage
    
    attr_reader :nShields
    
    def initialize(s)
      @nShields=s
    end
    
    def adjustShieldBoosters(s)
      return [s.length, @nShields].min
    end
    
    def discardShieldBooster
      if @nShields>0
        @nShields-=1
      end
    end
    
    def hasNoEffect
        @nShields==0
    end
    
    def to_s
      "Damage{" + "nShields= #{@nShields}"
    end
    
  end
  
end
