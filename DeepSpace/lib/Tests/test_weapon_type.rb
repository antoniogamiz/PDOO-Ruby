require 'test/unit'

require 'WeaponType'

module Tests
    class TestWeaponType < Test::Unit::TestCase
      def test_correct_enumerate
        assert !Deepspace::WeaponType::LASER.nil?, "LASER no definido"
        assert !Deepspace::WeaponType::MISSILE.nil?, "MISSILE no definido"
        assert !Deepspace::WeaponType::PLASMA.nil?, "PLASMA no definido"
      end

      def test_correct_values
        assert_equal 2, Deepspace::WeaponType::LASER.power, "'power' de LASER incorrecto"
        assert_equal 3, Deepspace::WeaponType::MISSILE.power, "'power' de MISSILE incorrecto"
        assert_equal 4, Deepspace::WeaponType::PLASMA.power, "'power' de PLASMA incorrecto"
      end
    end
end
