# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'HangarToUI'

module Deepspace

  class Hangar
    def initialize(capacity)
      @maxElements=capacity
      @weapons=Array.new()
      @shieldBoosters =Array.new()
    end

    def self.newCopy(h)
      copy = Hangar.new(h.maxElements)
 
      h.weapons.each { |w| copy.weapons.push(Weapon.new(w)) }     
      h.shieldBoosters.each { |s| copy.shieldBoosters.push(ShieldBooster.new(s)) }
      
      copy
    end

    attr_reader :maxElements, :weapons, :shieldBoosters

    def spaceAvailable
      ( @weapons.length + @shieldBoosters.length ) < @maxElements
    end

    
    def getUIversion
      HangarToUI.new(self)
    end

    def addWeapon(w)
      if spaceAvailable
        @weapons.push w
        true
      else
        false
      end
    end

    def addShieldBooster(s)
      if spaceAvailable
        @shieldBoosters.push s
        true
      else
        false
      end
    end

    def removeWeapon(w)
      if 0<=w && w<@weapons.length
        @weapons.delete_at(w) 
      else
        nil
      end  
    end

    def removeShieldBooster(s)
      if 0<=s && s<@shieldBoosters.length
        @shieldBoosters.delete_at(s) 
      else
        nil
      end  
    end

    def to_s
      "maxElements #{@maxElements}, weapons #{@weapons.join(", ")}, shieldBoosters #{@shieldBoosters.join(", ")}"
    end

    private :spaceAvailable

  end

end
