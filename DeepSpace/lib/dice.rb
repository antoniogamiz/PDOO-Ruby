# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module Deepspace
    class Dice
      def initialize()
        @NHANGARSPROB=0.25
        @NSHIELDSPROB=0.25
        @NWEAPONSPROB=0.33
        @FIRSTSHOTPROB=0.5
        @generator=Random.new
      end
      
      def initWithNHangars
        if @generator.rand < @NHANGARSPROB
          return 0
        else
          return 1
        end
      end
      
      def initWithNWeapons
        p = @generator.rand
        if p < @NWEAPONSPROB
          return 1
        elsif @NWEAPONSPROB <= p and p < @NWEAPONSPROB
          return 2
        else
          return 3
        end
      end
      
      def initWithNShields
        if @generator.rand < @NSHIELDSPROB
          return 0
        else
          return 1
        end
      end
      
      def whoStarts(nPlayers)
        return @generator.rand(NPlayers)
      end
      
      def firstShot
        if @generator.rand < @FIRSTSHOTPROB
          return GameCharacter::SPACESTATION
        else
          return GameCharacter::ENEMYSTARTSHIP
        end
      end
      
      def spaceStationMoves(speed)
        if @generator.rand < speed
          return true
        else
          return false
        end
      end
      
    end
end
