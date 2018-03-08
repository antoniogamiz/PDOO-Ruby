# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
  class SuppliesPackage
    def initialize(ammoPower, fuelUnits, shieldPower)
      @ammoPower=ammoPower
      @fuelUnits=fuelUnits
      @shieldPower=shieldPower
    end
    
    def newCopy(s)
      SuppliesPackage.new(s.ammoPower, s.fuelUnits, s.shieldPower)
    end
    
    def ammoPower
      @ammoPower
    end
    
    def fuelUnits
      @fuelUnits
    end
    
    def shieldPower
      @shieldPower
    end
    
  end
end
