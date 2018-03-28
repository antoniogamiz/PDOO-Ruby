# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Dice'
require_relative 'GameStateController'
require_relative 'GameUniverseToUI'
require_relative 'CardDealer'
require_relative 'SpaceStation'
require_relative 'CombatResult'
require_relative 'GameCharacter'

module Deepspace
class GameUniverse
  @@WIN=10
  def initialize
    @turns = 0
    @currentStationIndex = 0
    @dice = Dice.new
    @gameState = GameStateController.new
    @currentEnemy =  nil
    @spaceStations = []
    @currentStation = nil
  end

  def state
    @gameState.state
  end
  
  def combatGo(station, enemy)
      if @dice.firstShot == GameCharacter::ENEMYSTARSHIP
        result = station.receiveShot(enemy.fire)
        
        if result == ShotResult::RESIST
          result = enemy.receiveShot(station.fire)
          enemyWins = (result == ShotResult::RESIST)
        else
          enemyWins = true
        end
      else
        result = enemy.receiveShot(station.fire)
        enemyWins = (result == ShotResult::RESIST)
      end
      
      if enemyWins
        if(!@dice.spaceStationMoves(station.getSpeed))
          station.setPendingDamage(enemy.damage)
          combatResult = CombatResult::ENEMYWINS
        else
          station.move
          combatResult = CombatResult::STATIONESCAPES
        end  
      else
        station.setLoot(enemy.loot)
        combatResult = CombatResult::STATIONWINS
      end
      
      @gameState.next(@turns, @spaceStations.length)
      
      combatResult
  end

  def combat
      state = @gameState.state
      if state == GameState::BEFORECOMBAT || state == GameState::INIT
        combatGo(@currentStation, @currentEnemy)
      else
        CombatResult::NOCOMBAT
      end 
  end

  def discardHangar
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardHangar
    end
  end

  def discardShieldBooster(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardShieldBooster(i)
    end
  end

  def discardShieldBoosterInHangar(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardShieldBoosterInHangar(i)
    end
  end

  def discardWeapon(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardWeapon(i)
    end
  end

  def discardWeaponInHangar(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.discardWeaponInHangar(i)
    end
  end

  def getUIversion
    GameUniverseToUI.new(@currentStation, @currentEnemy)
  end

  def haveAWinner
    @currentStation.nMedals >= @@WIN
  end

  def init(names)
    if @gameState.state == GameState::CANNOTPLAY
      @spaceStations = Array.new
      dealer = CardDealer.instance

      for name in names
        supplies = dealer.nextSuppliesPackage
        station = SpaceStation.new(name, supplies)
        nh = @dice.initWithNHangars
        nw = @dice.initWithNWeapons
        ns = @dice.initWithNShields

        station.setLoot(Loot.new(0, nw, ns, nh, 0))
        @spaceStations.push(station)
      end

      @currentStationIndex = @dice.whoStarts(names.length)
      @currentStation = @spaceStations[@currentStationIndex]
      @currentEnemy = dealer.nextEnemy

      @gameState.next(@turns, @spaceStations.length)

      end
  end

  def mountShieldBooster(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.mountShieldBooster(i)
    end
  end

  def mountWeapon(i)
    if @gameState.state == GameState::INIT || @gameState.state == GameState::AFTERCOMBAT
      @currentStation.mountWeapon(i)
    end
  end

  def nextTurn
    if @gameState.state == GameState::AFTERCOMBAT 
      if @currentStation.validState 
        @currentStationIndex = (@currentStationIndex+1)%@spaceStations.length
        @turns += 1
          
        @currentStation = @spaceStations[@currentStationIndex]
        @currentStation.cleanUpMountedItems
                  
        @currentEnemy = CardDealer.instance.nextEnemy
        @gameState.next(@turns, @spaceStations.length)  

        true
      else
        false
      end
    else
      false
    end  
  end

end
end
