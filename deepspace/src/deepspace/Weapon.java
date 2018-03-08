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
public class Weapon {

    private String name;
    private WeaponType type;
    private int uses;
    
    Weapon(String name, WeaponType type, int uses){
        this.name=name;
        this.type=type;
        this.uses=uses;
    }
    
    Weapon(Weapon w){
        this(w.name, w.getType(), w.getUses());
    }
    
    public WeaponType getType(){
        return type;
    }
    
    public int getUses(){
        return uses;
    }
    
    public float power(){
        return type.getPower();
    }
    
    public float useIt(){
        if( uses > 0 ){
            uses--;
            return power();
        }
        else
            return 1.0f;
    }
}
