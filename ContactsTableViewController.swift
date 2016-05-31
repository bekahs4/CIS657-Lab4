//
//  ContactsTableViewController.swift
//  Lab4
//
//  Created by Bekah Suttner on 5/24/16.
//  Copyright © 2016 Bekah Suttner. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController {
    
    var people: JSON = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func loadData() {
        // open and parse a file named data.json dragged into the iOS project
        let filePath = NSBundle.mainBundle().pathForResource("data", ofType:"json")
        let data = NSData(contentsOfFile:filePath!)
        let json = JSON(data: data!)
        people = json["data"]
    }
    
    @IBAction func refreshContacts(sender: UIRefreshControl) {
        sender.endRefreshing()
        self.loadData()
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.people.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel!.text = people[indexPath.row][0].stringValue
        cell.detailTextLabel?.text = people[indexPath.row][1].stringValue
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
 

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            people.arrayObject?.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
//        else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let destVC = segue.destinationViewController as? DetailsTableViewController {
            if let sendObj = sender as? UITableViewCell {
                for i in 0 ..< people.count {
                    if (people[i][0].stringValue == sendObj.textLabel!.text!) {
                        destVC.name = people[i][0].stringValue
                        destVC.email = people[i][1].stringValue
                        destVC.phone = people[i][2].stringValue
                    }
                }
            }
        }
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
