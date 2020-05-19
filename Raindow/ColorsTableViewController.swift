//
//  ColorsTableViewController.swift
//  Raindow
//
//  Created by Drew Miller on 5/18/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class ColorsTableViewController: UITableViewController {

    var colors: [MyColor] = [
        MyColor(name: "Red", color: .red),
        MyColor(name: "Orange", color: .orange),
        MyColor(name: "Yellow", color: .yellow),
        MyColor(name: "Green", color: .green),
        MyColor(name: "Blue", color: .blue),
        MyColor(name: "Indigo", color: .cyan),
        MyColor(name: "Violet", color: .purple)
    ]
    
    //override func viewDidLoad() {
     //   super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    // MARK: - Table view data source

    /* Because there is only one section.
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }
 */
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return colors.count
    }

    //IndexPath is a coordinate system for rows.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell", for: indexPath)

        // Configure the cell...
        
        let color = colors[indexPath.row]
        
        cell.textLabel?.text = color.name
        cell.backgroundColor = color.color

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    // Get the new view controller using segue.destination.
    // Pass the selected object to the new view controller.
    /* 1. Make sure you are using the correct seque
     2.  */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //1. Make sure you are using the correct seque
        if segue.identifier == "ShowColorDetail" {
        //2. Get the instance of your detail view from the seque's destination.
            //3.  Get the index path for the row the user tapped.
            if let detailVC = segue.destination as? ColorDetailViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                //Initialize the Color with indexPath
                let color = colors[indexPath.row]
                //Pass the color to detail view
                detailVC.cellColor = color
            }
        }
    }
}
