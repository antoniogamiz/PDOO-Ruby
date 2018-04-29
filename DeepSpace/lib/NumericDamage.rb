# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Damage'
require_relative 'NumericDamageToUI'

class NumericDamage
  
  def initialize(n, s)
    super(s)
    @nWeapons= n
  end
  
  def copy(nd)
    NumericWeapon.new(@nWeapons, @nShields)
  end
  
  def getUIversion
    NumericWeaponToUI(self)
  end
end
