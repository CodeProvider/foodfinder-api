//
//  ContimentTableViewController.swift
//  FoodFinder_1
//
//  Created by Thomas Teichmeister on 16.01.15.
//  Copyright (c) 2015 FoodFinder. All rights reserved.
//

import UIKit


class ContimentTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {

    var CondimentList:NSMutableArray = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func SearchButton(sender: AnyObject) {
        
        var Output:NSString = "SearchButton"
        NSLog("LOG: Search Button pressed",Output)
    }
    override func viewDidAppear(animated: Bool) {
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var CondimentListFromUserDefaults:NSMutableArray? = userDefaults.objectForKey("CondimentList") as? NSMutableArray
        
        if ((CondimentListFromUserDefaults) != nil){
            CondimentList = CondimentListFromUserDefaults!
        }
        
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return CondimentList.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        
        var Condiment:NSMutableDictionary = CondimentList.objectAtIndex(indexPath.row) as NSMutableDictionary
        
        cell.textLabel?.text = Condiment.objectForKey("Condiment") as? NSString
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            
            var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
            
            var CondimentListFromUserDefaults:NSMutableArray = userDefaults.objectForKey("CondimentList") as NSMutableArray
            
            var mutableItemList:NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in CondimentListFromUserDefaults{
                mutableItemList.addObject(dict as NSDictionary)
            }
            var Item:NSDictionary = mutableItemList.objectAtIndex(indexPath.row) as NSDictionary
            mutableItemList.removeObject(Item)
            userDefaults.removeObjectForKey("CondimentList")
            userDefaults.setObject(mutableItemList, forKey: "CondimentList")
            
            userDefaults.synchronize()
            
            CondimentList = userDefaults.objectForKey("CondimentList") as NSMutableArray!
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
            self.tableView.reloadData()
            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "showDetail"){
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow()!
            var detailViewController:DetailViewController = segue.destinationViewController as DetailViewController
            detailViewController.DetailItem = CondimentList.objectAtIndex(selectedIndexPath.row) as NSDictionary
        }
        
        
    }
    
    
    

}
