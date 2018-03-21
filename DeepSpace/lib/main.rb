# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


require_relative 'WeaponType'
module Deepspace

a = [WeaponType::LASER, WeaponType::MISSILE, WeaponType::PLASMA]
a.delete_at(1)
  print a
end