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
      
      def to_s
        "NHANGARSPROB: @#{@NHANGARSPROB} NSHIELDSPROB: #{@NSHIELDSPROB} NWEAPONSPROB: #{@NWEAPONSPROB} FIRSTSHOTPROB: #{@FIRSTSHOTPROB}"
      end
      
      def initWithNHangars
        if @generator.rand < @NHANGARSPROB
          0
        else
          1
        end
      end
      
      def initWithNWeapons
        p = @generator.rand
        if p < @NWEAPONSPROB
          1
        elsif @NWEAPONSPROB <= p and p < @NWEAPONSPROB
          2
        else
          3
        end
      end
      
      def initWithNShields
        if @generator.rand < @NSHIELDSPROB
          0
        else
          1
        end
      end
      
      def whoStarts(nPlayers)
        @generator.rand(nPlayers)
      end
      
      def firstShot
        if @generator.rand < @FIRSTSHOTPROB
          GameCharacter::SPACESTATION
        else
          GameCharacter::ENEMYSTARTSHIP
        end
      end
      
      def spaceStationMoves(speed)
        if @generator.rand < speed
          true
        else
          false
        end
      end
      
    end
end
