//
//  GroupsTableViewController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import UIKit

class GroupsTableViewController: UITableViewController {

    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
    } //: DidLOAD
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    } //: WillAPPEAR

    
    //MARK: - ACTIONS
    @IBAction func addGroupButtonPressed(_ sender: Any) {
        GroupController.sharedInstance.createGroup()
        tableView.reloadData()
    }
    
    
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupController.sharedInstance.groups.count
    } //: #ROWS


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath)
        cell.selectionStyle         = .none
        
        let groupDisplayed          = GroupController.sharedInstance.groups[indexPath.row]
        
        var cellConfig              = cell.defaultContentConfiguration()
        cellConfig.text             = groupDisplayed.name
        cellConfig.secondaryText    = "\(groupDisplayed.people.count)"
        cell.contentConfiguration   = cellConfig

        return cell
    } //: CONFIG CELL


    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deleteThisGroup = GroupController.sharedInstance.groups[indexPath.row]
            GroupController.sharedInstance.deleteGroup(group: deleteThisGroup)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE ROW
    } //: EDIT STYLE - DELETE


    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPeopleTableViewController" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PeopleListTableViewController {
                    let groupToPass = GroupController.sharedInstance.groups[index.row]
                    destination.groupReceiver = groupToPass
                } //: DESTINATION + OBJECT TO PASS/RECEIVE
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

} //: CLASS
