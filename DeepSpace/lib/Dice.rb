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
      
        @EXTRAEFFICIENCYPROB=0.8
        
      end

      def to_s
        "NHANGARSPROB: @#{@NHANGARSPROB} NSHIELDSPROB: #{@NSHIELDSPROB} NWEAPONSPROB: #{@NWEAPONSPROB} FIRSTSHOTPROB: #{@FIRSTSHOTPROB}"
      end

      def initWithNHangars
        @generator.rand < @NHANGARSPROB ? 0 : 1
      end

      def initWithNWeapons
        p = @generator.rand
        if p < @NWEAPONSPROB
          1
        elsif @NWEAPONSPROB <= p and p < 1-@NWEAPONSPROB
          2
        else
          3
        end
      end

      def initWithNShields
       @generator.rand < @NSHIELDSPROB ? 0 : 1
      end

      def whoStarts(nPlayers)
        @generator.rand(nPlayers)
      end

      def firstShot
        @generator.rand < @FIRSTSHOTPROB ? GameCharacter::SPACESTATION : GameCharacter::ENEMYSTARSHIP
      end

      def spaceStationMoves(speed)
        @generator.rand < speed
      end
      
      def extraEfficiency
          @generator.rand >= EXTRAEFFICIENCYPROB ? true:false 
      end

    end
end
