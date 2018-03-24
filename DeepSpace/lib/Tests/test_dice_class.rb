require 'test/unit'

require 'Dice'
require 'GameCharacter'

module Tests
    class TestDiceClass < Test::Unit::TestCase

      def setup
        @dice=Deepspace::Dice.new
      end

      def test_methos_init
        assert_respond_to @dice, :initWithNHangars, "No existe el metodo :initWithNHangars"
        assert_respond_to @dice, :initWithNWeapons, "No existe el metodo :initWithNWeapns"
        assert_respond_to @dice, :initWithNShields, "No existe el metodo :initWithNShields"
      end

      def test_who_starts
        assert_respond_to @dice, :whoStarts, "No existe el metodo :whoStarts"
        assert @dice.whoStarts(10) <= 10, ":whoStarts incorrecto"
      end

      def test_space_station_moves
        assert_respond_to @dice, :spaceStationMoves, "No existe el metodo :spaceStationMoves"
        assert @dice.spaceStationMoves(1.1), "Nº aleatorio generado fuera de rango"
        assert !@dice.spaceStationMoves(0), "Nº aleatorio generado fuera de rango"
      end

      def test_to_s
        assert_respond_to @dice, :to_s, "No existe el metodo: :to_s"
      end

      def test_probs
        n = [0,0,0,0]

        for i in 1..1000
          if @dice.initWithNHangars == 0
            n[0]=n[0]+1.0
          end
          if @dice.initWithNWeapons == 1
            n[1]=n[1]+1.0
          end
          if @dice.initWithNShields == 0
            n[2]=n[2]+1.0
          end
          if @dice.firstShot == Deepspace::GameCharacter::SPACESTATION
            n[3]=n[3]+1.0
          end
        end

        p1=n[0]/1000.0
        p2=n[1]/1000.0
        p3=n[2]/1000.0
        p4=n[3]/1000.0

        assert 0.2 < p1 && p1 < 0.3, "Probabilidad P1 incorrecta"
        assert 0.28 < p2 && p2 < 0.38, "Probabilidad P2 incorrecta"
        assert 0.2 < p3 && p3 < 0.3, "Probabilidad P3 incorrecta"
        assert 0.45 < p4 && p4 < 0.55, "Probabilidad P4 incorrecta"

      end

    end
end
