# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'DamageToUI'

module Deepspace

class Damage
  def initialize(w, s, wl)
    @nShields=s
    if wl == nil
      @weapons=nil
      @nWeapons= w
    else
      @weapons=Array.new(wl)
      @nWeapons= nil
    end

  end

  def self.newCopy(d)
    new(d.nWeapons, d.nShields, d.weapons)
  end

  attr_reader :nShields, :nWeapons, :weapons

  def getUIversion
    DamageToUI.new(self)
  end

  def self.newNumericWeapons(w, s)
    new(w,s,nil)
  end

  def self.newSpecificWeapons(wl, s)
    new(nil,s,wl)
  end

  def adjust(w, s)
    ns = [s.length, @nShields].min
    aux = Damage.new(nil, ns, @weapons & w)
    aux
  end

  def arrayContainsType(w, t)
    index=w.index(t)
    if index == nil
      -1
    else
      index
    end
  end

  def discardWeapon(w)
    if @weapons != nil
      index= 0
        for i in @weapons
          if i.type == w.type
            @weapons.delete_at(index)
            break
          end
          index += 1
        end
    else
      if @nWeapons > 0
        @nWeapons -= 1
      end
    end
  end

  def discardShieldBooster
    if @nShields > 0
      @nShields-=1
    else
      @nShields=0
    end
  end

  def hasNoEffect
    @nShields == 0 && @nWeapons ==0 && @weapons == nil
  end

  private :arrayContainsType
end

end
