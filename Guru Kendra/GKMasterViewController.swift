//
//  MasterViewController.swift
//  Guru Kendra
//
//  Created by Siddalingamurthy Gangadharappa on 10/17/15.
//  Copyright © 2015 Adroit. All rights reserved.
//

import UIKit

class GKMasterViewController: UITableViewController {

    var detailViewController: GKDetailViewController? = nil
    var aboutusObjects = [AnyObject]()
    
    /// User Entry Mode
    var userEntryMode: GKMasterDetailState
    
    /**
     
     int Function
     
     - Parameter: coder
     
     */
    init(userEntryMode:GKMasterDetailState) {
        self.userEntryMode = userEntryMode
        super.init(style: UITableViewStyle.Plain)
    }


    required init?(coder aDecoder: NSCoder) {
        self.userEntryMode = GKMasterDetailState.GKUserEntryState
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? GKDetailViewController
        }
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                //let object = aboutusObjects[indexPath.row] as! NSDate
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! GKDetailViewController

            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch (self.applicationEntryState()) {
        case .GKUserEntryState:
            return 1
        case .GKLogedInUserState:
            //FIXME: Temporarily Hardcoded
            return 5
        case .GKGuestUserState:
            //FIXME: Temporarily Hardcoded
            return 3
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        //let object = aboutusObjects[indexPath.row] as! NSDate
        return cell
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            aboutusObjects.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }

    // MARK: - Private Methods
    private func applicationEntryState() -> GKMasterDetailState {
        
        return GKMasterDetailState.GKUserEntryState
    }
    
    
}

