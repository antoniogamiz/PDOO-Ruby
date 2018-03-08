/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package deepspace;

import java.util.Random;

/**
 *
 * @author antonio
 */
public class Dice {
    
    private final float NHANGARSPROB;
    private final float NSHIELDSPROB;
    private final float NWEAPONSPROB;
    private final float FIRSTSHOTPROB;
    private Random generator;
    
    Dice(){
        NHANGARSPROB=0.25f;
        NSHIELDSPROB=0.25f;
        NWEAPONSPROB=0.33f;
        FIRSTSHOTPROB=0.5f;
        generator=new Random();
    }
    
    int initWithNHangars(){
        if( generator.nextFloat() < NHANGARSPROB )
            return 0;
        else
            return 1;
    }
    
    int initWithNWeapons(){
        float p = generator.nextFloat();
        
        if(p < NWEAPONSPROB)
            return 1;
        else if( NWEAPONSPROB <= p && p < NWEAPONSPROB*2 )
            return 2;
        else
            return 3;
    }
    
    int initWithNShields(){
        if( generator.nextFloat() < NSHIELDSPROB )
            return 0;
        else
            return 1;        
    }
    
    int whoStarts(int nPlayers){
        return generator.nextInt(nPlayers);
    }
    
    GameCharacter firstShot(){
        if( generator.nextFloat() < FIRSTSHOTPROB )
            return GameCharacter.SPACESTATION;
        else
            return GameCharacter.ENEMYSTARTSHIP;
    }
    
    boolean spaceStationMovas(float speed){
        if( generator.nextFloat() < speed )
            return true;
        else
            return false;
    }
    
}
