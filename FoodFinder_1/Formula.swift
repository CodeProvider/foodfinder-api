//
//  Formula.swift
//  FoodFinder_1
//
//  Created by Thomas Teichmeister on 17.01.15.
//  Copyright (c) 2015 FoodFinder. All rights reserved.
//

import Foundation

class Formula: NSObject{
    

    // Variables
    
    // ZutatenListe
    private var m_CondimentList:NSMutableArray = NSMutableArray()
    
    // Rezept-Bezeichnung
    
    private var m_FormulaName:NSString = NSString()
    
    // Dauer
    
     private var m_Duration:Int64 = Int64()
    
    // Rezept - Beschreibung/ Zubereitung
    
    private var m_FormulaDescription:NSString = NSString()
    
    
    
    // Functions
    
    func GetCondimentList()->NSMutableArray{
        return m_CondimentList
    }
    
    func SetCondimentList(Array: NSMutableArray){
        m_CondimentList = Array
    }
    
    func GetFormulaName()->NSString{
        return m_FormulaName
    }
    
    func SetFormulaName(name: NSString){
        m_FormulaName = name
    }
    
    func GetDuration()->Int64{
        return m_Duration
    }
    
    func SetDuration(dur: Int64){
        m_Duration = dur
    }
    
    func GetFormulaDescription()->NSString{
        return m_FormulaDescription
    }
    
    func SetFormulaDescription(desc: NSString){
        m_FormulaDescription = desc
    }
}