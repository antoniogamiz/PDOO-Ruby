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
public class ShieldBooster {
    
    private String name;
    private float boost;
    private int uses;
    
    ShieldBooster(String name, float boost, int uses){
        this.name=name;
        this.boost=boost;
        this.uses=uses;
    }
    
    ShieldBooster(ShieldBooster s){
        this(s.name, s.getBoost(), s.getUses());
    }
    
    public float getBoost(){
        return boost;
    }

    public int getUses(){
        return uses;
    }
    
    public float useIt(){
        if( uses > 0 ){
            uses--;
            return boost;
        }
        else
            return 1.0f;
    }
}

