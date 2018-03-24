# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'HangarToUI'

module Deepspace

  class Hangar
    def initialize(capacity)
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
        @shieldBoosters.push s
        true
      else
        false
      end
    end

    def removeWeapon(w)
      if @weapons.length > w && w >= 0
        @weapons.delete_at(w)
      else
        return nil
      end
    end

    def removeShieldBooster(s)
      if @shieldBoosters.length > s && s >= 0
        @shieldBoosters.delete_at(s)
      else
        return nil
      end
    end

    def to_s
    end

    private
    def spaceAvailable
      @weapons.length + @shieldBoosters.length < @maxElements
    end

  end

end
