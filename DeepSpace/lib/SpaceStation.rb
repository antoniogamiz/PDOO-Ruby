# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'SpaceStationToUI'

module Deepspace

class SpaceStation
  @@MAXFUEL=100
  @@SHIELDLOSSPERUNITSHOT=0.1

  def initialize(n, supplies)
    @name=n
    @ammoPower=supplies.ammoPower
    @fuelUnits=supplies.fuelUnits
    @shieldPower=supplies.shieldPower
    @nMedals=0
    @weapons=[]
    @shieldBoosters=[]
    @hangar=nil
    @pendingDamage=nil
  end

  attr_reader :ammoPower, :fuelUnits, :hangar, :name, :nMedals, :pendingDamage, :shieldBoosters, :shieldPower, :weapons

  def speed
    (@fuelUnits.to_f/@@MAXFUEL.to_f)
  end

  def assignFuelValue(f)
    if f<=@@MAXFUEL
      @fuelUnits=f
    end
  end

  def cleanPendingDamage
    if @pendingDamage.hasNoEffect
      @pendingDamage=nil
    end
  end

  def cleanUpMountedItems
    weapons=@weapons.clone
    for i in 0...@weapons.length
      if weapons[i].uses == 0
        @weapons.delete_at(i)
      end
    end
    shieldBoosters=@shieldBoosters.clone
    for i in 0...@shieldBoosters.length
      if shieldBoosters[i].uses == 0
        @shieldBoosters.delete_at(i)
      end
    end
  end

  def discardHangar
    @hangar=nil
  end

  def discardShieldBooster(i)

  end

  def discardShieldBoosterInHangar(i)
    if @hangar != nil
      @hangar.removeShieldBooster(i)
    end
  end

  def discardWeapon(i)

  end

  def discardWeaponInHangar(i)
    if @hangar!=nil
      @hangar.removeWeapon(i)
    end
  end

  def fire

  end

  def getUIversion
    SpaceStationToUI.new(self)
  end

  def mountShieldBooster(i)
    if @hangar != nil
      s = @hangar.removeShieldBooster(i)
      if s != nil
        @shieldBoosters.push(s)
      end
    end
  end

  def mountWeapon(i)
    if @hangar != nil
      w = @hangar.removeWeapon(i)

      if w != nil
        @weapons.push(w)
      end
    end
  end

  def move
    @fuelUnits-=speed
  end

  def protection

  end

  def receiveWeapon(w)
    if @hangar == nil
      false
    else
      @hangar.addWeapon(w)
    end
  end

  def receiveHangar(h)
    if @hangar==nil
      @hangar=h
    end
  end

  def receiveShieldBooster(s)
    if @hangar == nil
      false
    else
      @hangar.addShieldBooster(s)
    end
  end

  def receiveShot(shot)

  end

  def receiveSupplies(s)
    @ammoPower+=s.ammoPower
    @shieldPower+=s.shieldPower
    if @fuelUnits + s.fuelUnits <= @@MAXFUEL
        @fuelUnits+=s.fuelUnits
    else
        @fuelUnits=@@MAXFUEL
    end
  end

  def receiveWeapon(w)
    if @hangar == nil
      false
    else
      @hangar.addWeapon(w)
    end
  end

  def setLoot(loot)

  end

  def setPendingDamage(d)
      @pendingDamage = d.adjust(@weapons, @shieldBoosters)
  end

  def validState
    if @pendingDamage!=nil
      if @pendingDamage.hasNoEffect
        @pendingDamage=nil
      end
    end
    @pendingDamage == nil
  end

  private :assignFuelValue, :cleanPendingDamage
end
end
