# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'EnemyToUI'

module Deepspace
class EnemyStarShip
  def initialize(n, a, s, l, d)
    @name=n
    @ammoPower=a
    @shieldPower=s
    @loot=l
    @damage=d
  end
  
  def self.newCopy(d)
    new(d.name, d.ammoPower, d.shieldPower, d.loot, d.damage)
  end
  
  attr_reader :name, :ammoPower, :shieldPower, :loot, :damage
  
  def fire
    @ammoPower
  end
  
  def getUIversion
    EnemyToUI.new(self)
  end
  
  def protection
    @shieldPower
  end
  
  def receiveShot(shot)
    if shot > @shieldPower
      ShotResult::DONOTRESIST
    else
      ShotResult::RESIST
    end
  end
end
end
