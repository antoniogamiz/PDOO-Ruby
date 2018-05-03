# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Damage'
require_relative 'NumericDamageToUI'

class NumericDamage < Damage
  
  attr_reader :nWeapons
  
  def initialize(n, s)
    super(s)
    @nWeapons=n
  end
  
  def copy(nd)
    NumericWeapon.new(nd.nWeapons, nd.nShields)
  end
  
  def getUIversion
    NumericWeaponToUI(self)
  end
  
  def adjust(w, s)
    new([@nWeapons, w.length].min, adjustShieldBoosters(s))
  end
  
  def discardWeapon(w)
    if @nWeapons > 0
      @nWeapons-=1
    end
  end
  
  def hasNoEffect
    super && @nWeapons==0
  end
  
  def toString
    super + "Weapons= #{@nWeapons}." 
  end
  
  
  
end
