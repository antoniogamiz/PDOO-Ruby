# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'DamageToUI'

module Deepspace
  
class Damage
  def initialize(w, s, wl)
    @nWeapons=w
    @nShields=s    
    if wl == nil
      @weapons=nil
    else
      @weapons=Array.new(wl)
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
    if @weapons==nil
      Damage.newNumericWeapons([@nWeapons,w.length].min, [@nShields,s.length].min)      
    else
      damage_adjust=Damage.newSpecificWeapons(@weapons, [@nShields, s.length].min)
      @weapons.each {|x| index=arrayContainsType(damage_adjust.weapons, x); if index==-1; damage_adjust.weapons.delete(x); end }
      damage_adjust
    end
    
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
    if @weapons != nil #Entonces es específico
      @weapons.delete(w.type)
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
    @nShields == 0 && @nWeapons ==0
  end

  private :arrayContainsType
end

end