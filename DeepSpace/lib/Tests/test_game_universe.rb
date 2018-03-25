require 'test/unit'

require 'GameUniverse'

module Tests
    class TestGameUniverseClass < Test::Unit::TestCase

      def setup
        @game=Deepspace::GameUniverse.new
      end

      def test_discards
        assert_respond_to @game, :discardHangar, "No existe el metodo :discardHangar"
        assert_respond_to @game, :discardShieldBooster, "No existe el metodo :discardShieldBooster"
        assert_respond_to @game, :discardShieldBoosterInHangar, "No existe el metodo :discardShieldBoosterInHangar"
        assert_respond_to @game, :discardWeapon, "No existe el metodo :discardWeapon"
        assert_respond_to @game, :discardWeaponInHangar, "No existe el metodo :discardWeaponInHangar"
        assert_respond_to @game, :gameState, "No existe el getter :gameState"
        assert_respond_to @game, :mountWeapon, "No existe el metodo :mountWeapon"
        assert_respond_to @game, :mountShieldBooster, "No existe el metodo :mountShieldBooster"
      end

      def test_init
        assert_respond_to @game, :init, "No existe el metodo :init"
      end

      def test_have_a_winner
        assert_respond_to @game, :haveAWinner, "No existe el metodo :haveAWinner"
      end

      def test_next_turn
        assert_respond_to @game, :nextTurn, "No existe el metodo :nextTurn"
      end

      def test_get_ui_version
        assert_respond_to @game, :getUIversion, "No existe el metodo :getUIversion"
      end

    end
end
