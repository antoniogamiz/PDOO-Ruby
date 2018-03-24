require 'test/unit'

require 'SuppliesPackage'

module Tests
    class TestSuppliesPackage < Test::Unit::TestCase

      def setup
        @supplies=Deepspace::SuppliesPackage.new(10, 20, 30)
      end

      def test_new_copy
        assert Deepspace::SuppliesPackage.respond_to? :newCopy
        copy=Deepspace::SuppliesPackage.newCopy(@supplies)
        assert_equal @supplies.ammoPower, copy.ammoPower, "Error en :newCopy (attr: ammoPower)"
        assert_equal @supplies.fuelUnits, copy.fuelUnits, "Error en :newCopy (attr: fuelUnits)"
        assert_equal @supplies.shieldPower, copy.shieldPower, "Error en :newCopy (attr: shieldPower)"
      end

      def test_ammo_power
        assert_respond_to @supplies, :ammoPower, "No existe el getter :ammoPower"
        assert_equal 10, @supplies.ammoPower, "Fallo inicializando :ammoPower"
      end

      def test_fuel_units
        assert_respond_to @supplies, :fuelUnits, "No existe el getter :fuelUnits"
        assert_equal 20, @supplies.fuelUnits, "Fallo inicializando :fuelUnits"
      end

      def test_shield_power
        assert_respond_to @supplies, :shieldPower, "No existe el getter :shieldPower"
        assert_equal 30, @supplies.shieldPower, "Fallo inicializando :shieldPower"
      end

    end
end
