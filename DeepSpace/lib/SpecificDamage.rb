# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Damage'
require_relative 'SpecificDamageToUI'

module Deepspace

class SpecificDamage < Damage

  attr_reader :weapons
  
  def initialize(w, s)
    super(s)
    @weapons=w
  end

  def copy(sp)
    new(sp.weapons, sp.nShields)
  end

  def getUIversion
    SpecificDamageToUI.new(self)
  end

  def adjust(w, s)
      weapons=Array.new
      wt=Array.new
      w.each{ |x|
        wt.push x.type
      }
      @weapons.each { |x|
        n=[@weapons.count(x), wt.count(x)].min
        if weapons.count(x)==0 && n!=0
          for i in 1..n
            weapons.push x
          end
        end
      }
      new(weapons, adjustShieldBoosters(s))
  end

  def arrayContainsType(w, t)
    index=w.index(t)
    index == nil ? -1:index
  end

  def discardWeapon(w)
    index= 0
      for i in @weapons
        if i == w.type
          @weapons.delete_at(index)
          break
        end
        index += 1
      end
  end

  def hasNoEffect()
    super && @weapons.empty?
  end

  def to_s
    super + "Weapons= #{@weapons}."
  end
end

end