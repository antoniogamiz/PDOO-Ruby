require 'test/unit'

require 'Hangar'
require 'Weapon'
require 'ShieldBooster'

module Tests
    class TestHangarClass < Test::Unit::TestCase

      def setup
        @hangar=Deepspace::Hangar.new(4)
        @w1=Deepspace::Weapon.new("w1", Deepspace::WeaponType::LASER, 1)
        @w2=Deepspace::Weapon.new("w2", Deepspace::WeaponType::MISSILE, 2)
        @s1=Deepspace::ShieldBooster.new("s1", 1, 2)
        @s2=Deepspace::ShieldBooster.new("s2", 1, 2)
      end

      def test_new_copy
        assert Deepspace::Hangar.respond_to? :newCopy
        copy=Deepspace::Hangar.newCopy(@hangar)
        assert_equal @hangar.maxElements, copy.maxElements, "Error en :newCopy (attr: maxElements)"
        assert_equal @hangar.weapons, copy.weapons, "Error en :newCopy (attr: weapons)"
        assert_equal @hangar.shieldBoosters, copy.shieldBoosters, "Error en :newCopy (attr: shieldBoosters)"
      end

      def test_max_elements
        assert_respond_to @hangar, :maxElements, "No existe el getter :maxElements"
        assert_equal 4, @hangar.maxElements, "Fallo inicializando :maxElements"
      end

      def test_weapons
        assert_respond_to @hangar, :weapons, "No existe el getter :weapons"
        assert_equal [], @hangar.weapons, "Fallo inicializando :weapons"
      end

      def test_shield_booster
        assert_respond_to @hangar, :shieldBoosters, "No existe el getter :shieldBoosters"
        assert_equal [], @hangar.shieldBoosters, "Fallo inicializando :shieldBoosters"
      end

      def test_add_weapon
        assert @hangar.addWeapon(@w1), "Fallo al añadir un arma"
        @hangar.addWeapon(@w2)
        assert_equal [@w1, @w2], @hangar.weapons, "Vector de weapons incorrecto"
      end

      def test_add_shield_booster
        assert @hangar.addShieldBooster(@s1), "Fallo al añadir un escudo"
        @hangar.addShieldBooster(@s2)
        assert_equal [@s1, @s2], @hangar.shieldBoosters, "Vector de escudos incorrecto"
      end

      def test_remove_weapon
        self.test_add_weapon
        assert_equal @w1, @hangar.removeWeapon(0), "Fallo en :removeWeapon"
        assert_equal [@w2], @hangar.weapons, "Fallo en :removeWeapon"
        assert_equal @w2, @hangar.removeWeapon(0), "Fallo en :removeWeapon (2)"
        assert_equal [], @hangar.weapons, "Fallo en :removeWeapon (2)"
      end

      def test_remove_shield_booster
        self.test_add_shield_booster
        assert_equal @s1, @hangar.removeShieldBooster(0), "Fallo en :removeShieldBooster"
        assert_equal [@s2], @hangar.shieldBoosters, "Fallo en :removeShieldBooster"
        assert_equal @s2, @hangar.removeShieldBooster(0), "Fallo en :removeShieldBooster (2)"
        assert_equal [], @hangar.shieldBoosters, "Fallo en :removeShieldBooster (2)"
      end

      def test_get_ui_version
        assert_respond_to @hangar, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @hangar, :to_s, "No existe el metodo :to_s"
      end

    end
end
