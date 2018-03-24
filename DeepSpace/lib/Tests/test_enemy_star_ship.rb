require 'test/unit'

require 'EnemyStarShip'
require 'ShieldBooster'
require 'Loot'
require 'ShotResult'
require 'Damage'

module Tests
    class TestEnemyStarShipClass < Test::Unit::TestCase

      def setup
        @loot=Deepspace::Loot.new(1,2,3,4,5)
        @damage=Deepspace::Damage.new(10,20,30)
        @enemy_star=Deepspace::EnemyStarShip.new("test", 10, 20, @loot, @damage )
      end

      def test_new_copy
        assert Deepspace::EnemyStarShip.respond_to? :newCopy
        copy=Deepspace::EnemyStarShip.newCopy(@enemy_star)
        assert_equal @enemy_star.name, copy.name, "Error en :newCopy (attr: name)"
        assert_equal @enemy_star.ammoPower, copy.ammoPower, "Error en :newCopy (attr: ammoPower)"
        assert_equal @enemy_star.shieldPower, copy.shieldPower, "Error en :newCopy (attr: loot)"
        assert_equal @enemy_star.loot, copy.loot, "Error en :newCopy (attr: loot)"
        assert_equal @enemy_star.damage, copy.damage, "Error en :newCopy (attr: damage)"
      end

      def test_getters
        assert_respond_to @enemy_star, :name, "No existe el getter :name"
        assert_respond_to @enemy_star, :ammoPower, "No existe el getter :ammoPower"
        assert_respond_to @enemy_star, :shieldPower, "No existe el getter :shieldPower"
        assert_respond_to @enemy_star, :loot, "No existe el getter :loot"
        assert_respond_to @enemy_star, :damage, "No existe el getter :damage"
      end

      def test_fire
        assert_respond_to @enemy_star, :fire, "No existe el getter :fire"
        assert_equal 10, @enemy_star.fire, "Fallo en :fire"
      end

      def test_protection
        assert_respond_to @enemy_star, :protection, "No existe el getter :protection"
        assert_equal 20, @enemy_star.protection, "Fallo en :protection"
      end

      def test_receive_shot
        assert_respond_to @enemy_star, :receiveShot, "No existe el getter :receiveShot"
        assert_equal Deepspace::ShotResult::DONOTRESIST, @enemy_star.receiveShot(100), "Fallo en DONOTRESIST"
        assert_equal Deepspace::ShotResult::RESIST, @enemy_star.receiveShot(10), "Fallo en RESIST"        
      end

      def test_get_ui_version
        assert_respond_to @enemy_star, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @enemy_star, :to_s, "No existe el metodo :to_s"
      end

    end
end
