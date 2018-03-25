# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require_relative 'Dice'
# require_relative 'GameStateCrontoller'
require_relative 'GameUniverseToUI'

module Deepspace
class GameUniverse
  @@WIN=10
  def initialize
    @turns = 0
    @currentStationIndex = 0
    @dice = Dice.new
    # @gameState = GameStateController.new
    @currentEnemy =  nil
    @spaceStations = []
    @currentStation = nil
  end

  attr_reader :gameState

  def combat

  end

  def combat_con_argumentos

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

  end

end
end
