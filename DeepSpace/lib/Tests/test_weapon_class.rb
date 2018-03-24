require 'test/unit'

require 'Weapon'
require 'WeaponType'

module Tests
    class TestWeaponClass < Test::Unit::TestCase

      def setup
        @weapon=Deepspace::Weapon.new("test", Deepspace::WeaponType::LASER, 3)
      end

      def test_new_copy
        assert Deepspace::Weapon.respond_to? :newCopy
        copy=Deepspace::Weapon.newCopy(@weapon)
        assert_equal @weapon.name, copy.name, "Error en :newCopy (attr: name)"
        assert_equal @weapon.type, Deepspace::WeaponType::LASER, "Error en :newCopy (attr: type)"
        assert_equal @weapon.uses, copy.uses, "Error en :newCopy (attr: uses)"
      end

      def test_name
        assert_respond_to @weapon, :name, "No existe el getter :name"
        assert_equal "test", @weapon.name, "Fallo inicializando :name"
      end

      def test_type
        assert_respond_to @weapon, :type, "No existe el getter :type"
        assert_equal Deepspace::WeaponType::LASER, @weapon.type, "Fallo inicializando :type"
      end

      def test_uses
        assert_respond_to @weapon, :uses, "No existe el getter :uses"
        assert_equal 3, @weapon.uses, "Fallo inicializando :uses"
      end

      def test_power
        assert_respond_to @weapon, :power, "No existe el getter :power"
        assert_equal 2, @weapon.power, "Fallo inicializando :power"
      end

      def useIt
        assert_respond_to @weapon, :useIt, "No existe el metodo :useIt"
        assert_equal 2, @weapon.useIt, "Error en :useIt"
        assert_equal 2, @weapon.useIt, "Error en :useIt"
        assert_equal 1, @weapon.useIt, "Error en :useIt (Al intentar restar más de los debidos)"
      end

      def test_get_ui_version
        assert_respond_to @weapon, :getUIversion, "No existe el metodo :getUIversion"
      end

      def test_to_s
        assert_respond_to @weapon, :to_s, "No existe el metodo :to_s"
      end

    end
end
