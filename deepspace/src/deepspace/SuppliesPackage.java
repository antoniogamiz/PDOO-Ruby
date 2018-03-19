/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

/**
 *
 * @author antonio
 */
public class SuppliesPackage {
    
    private float ammoPower;
    private float fuelUnits;
    private float shieldPower;
    
    SuppliesPackage(float ammoPower, float fuelUnits, float shieldPower){
        this.ammoPower=ammoPower;
        this.fuelUnits=fuelUnits;
        this.shieldPower=shieldPower;
    }
    
    SuppliesPackage(SuppliesPackage s){
        this(s.getAmmoPower(), s.getFuelUnits(), s.getShieldPower());
    }

    public float getAmmoPower() {
        return ammoPower;
    }

    public float getFuelUnits() {
        return fuelUnits;
    }

    public float getShieldPower() {
        return shieldPower;
    }
    


}
