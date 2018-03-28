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
    @weapons=Array.new()
    @shieldBoosters=Array.new()
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
    else
      @fuelUnits=@@MAXFUEL
    end
  end

  def cleanPendingDamage
    if @pendingDamage.hasNoEffect && @pendingDamage != nil
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
      if i>=0 && i<@shieldBoosters.length
        @shieldBoosters.delete_at(i)
        if pendingDamage!=nil
          pendingDamage.discardShieldBooster
          cleanPendingDamage
        end
      end
  end

  def discardShieldBoosterInHangar(i)
    if @hangar != nil
      @hangar.removeShieldBooster(i)
    end
  end

  def discardWeapon(i)
      if i>=0 && i<@weapons.length
        w=@weapons.delete_at(i)
        if @pendingDamage!=nil
          @pendingDamage.discardWeapon(w)
          cleanPendingDamage
        end
    end
  end

  def discardWeaponInHangar(i)
    if @hangar!=nil
      @hangar.removeWeapon(i)
    end
  end

  def fire
    size=@weapons.length
    factor=1
    
    for i in (0..size)
      factor*=@weapons[i].useIt
    end
    
    @ammoPower*factor    
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
    size=@shieldBoosters.lenght
    factor=1
    
    for i in (0..size)
      factor*=@shieldBoosters[i].useIt
    end
    
    @shieldPower*factor
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
      myProtection = protection()
      
      if myProtection >= shot
        @shieldPower-=@@SHIELDLOSSPERUNITSHOT*shot
        @shieldPower=[0.0, @shieldPower].max
        ShotResult::RESIST
      else
        @shieldPower=0.0
        ShotResult::DONOTRESIST
      end
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
      dealer=CardDealer.instance
      
      if loot.nHangars > 0
        receiveHangar(dealer.nextHangar)
      end
      
      for i in (0...loot.nSupplies)
        receiveSupplies(dealer.nextSuppliesPackage)
      end
      
      for i in (0...loot.nWeapons)
        receiveWeapon(dealer.nextWeapon)
      end
      
      for i in (0...loot.nShields)
        receiveShieldBooster(dealer.nextShieldBooster)
      end
      
      @nMedals+=loot.nMedals
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
