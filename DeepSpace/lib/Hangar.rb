# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

#No meto el modulo Weapon ya que no se crean objetos Weapons.
require_relative 'HangarToUI'

module Deepspace

  class Hangar
    def initialize(capacity) # Duda 1 con el nombre de los constructores
      @maxElements=capacity
      @weapons = []
      @shieldBoosters = []
    end
    
    def self.newCopy(h)
        new(h.maxElements)
    end
    
    attr_reader :maxElements, :weapons, :shieldBoosters
    
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
        @shieldBooster.push s
        true
      else
        false
      end
    end

    def removeWeapon(w)
      if @weapons.lenght > w
        weapon = @weapons[w]
        @weapons.pop w
        weapon
      else
        return nil
      end
    end

    def removeShieldBooster(s)
      if @shieldBooster.lenght > s
        weapon = @wshieldBooster[s]
        @shieldBooster.pop s
        weapon
      else
        return nil
      end
    end
    
    private
    def spaceAvailable # Duda 2 No se si considerar maxElements por separado o entre los dos.
      if @weapons.length + @shieldBoosters.length < @maxElements
        true
      else
        false
      end
    end
    
  end

end