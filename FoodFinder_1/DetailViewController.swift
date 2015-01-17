//
//  DetailViewController.swift
//  FoodFinder_1
//
//  Created by Thomas Teichmeister on 17.01.15.
//  Copyright (c) 2015 FoodFinder. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    // Variables
    
    var DetailItem:NSDictionary = NSDictionary()
    @IBOutlet var DetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        DetailLabel.text = DetailItem.objectForKey("Condiment") as? String

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
