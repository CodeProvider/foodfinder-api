//
//  ViewController.swift
//  FoodFinder_1
//
//  Created by Thomas Teichmeister on 16.01.15.
//  Copyright (c) 2015 FoodFinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    
    // variables
    
    @IBOutlet var ItemLablel: UILabel!
    @IBOutlet var ItemUIPickerView: UIPickerView!
    
    var CondimentList = ["Salz", "Pfeffer", "Öl", "Tomaten", "Knoblauch", "Zwiebeln", "Nudeln", "Basilikum"]
    
    var currentCondiment = ""
    
    // functions
    override func viewDidLoad() {
        super.viewDidLoad()
        ItemUIPickerView.dataSource = self
        ItemUIPickerView.delegate   = self
        currentCondiment = ""
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func SaveItemForCondimentListButton(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        var ItemList:NSMutableArray? = userDefaults.objectForKey("CondimentList") as? NSMutableArray
        
        var Item:NSMutableDictionary = NSMutableDictionary()
        Item.setObject(currentCondiment, forKey: "Condiment")
        if (ItemList != nil){
            
            // if data already exist
            var newItemList:NSMutableArray = NSMutableArray()
            for i:AnyObject in ItemList!{
                newItemList.addObject(i as NSDictionary)
            }
            
            newItemList.addObject(Item)
            
            userDefaults.removeObjectForKey("CondimentList")
            userDefaults.setObject(newItemList, forKey: "CondimentList")
        }
        else{
            userDefaults.removeObjectForKey("CondimentList")
            ItemList = NSMutableArray()
            ItemList!.addObject(Item)
            userDefaults.setObject(ItemList, forKey: "CondimentList")
        }
        
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    
    // UIPickerView
    
    // returns the number of 'columns' to display.
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    // returns the # of rows in each component..
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return CondimentList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String!{
       return CondimentList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        ItemLablel.text = CondimentList[row]
        currentCondiment = CondimentList[row]
        return
    }
}

