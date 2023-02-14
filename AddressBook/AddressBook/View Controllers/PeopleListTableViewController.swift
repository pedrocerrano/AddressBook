//
//  PeopleTableViewController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import UIKit

class PeopleListTableViewController: UITableViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var groupNameTextField: UITextField!
    
    
    
    //MARK: - PROPERTIES
    var groupReceiver: Group?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    } //: DidLOAD
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    } //: WillAPPEAR
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let groupReceiver = groupReceiver,
              let name = groupNameTextField.text else { return }
        GroupController.sharedInstance.updateGroup(groupToUpdate: groupReceiver, newName: name)
    } //: WillDISAPPEAR
    
    
    //MARK: - ACTIONS
    
    @IBAction func addPersonButtonPressed(_ sender: Any) {
        guard let groupReceiver = groupReceiver else { return }
        PersonController.createPerson(group: groupReceiver)
        tableView.reloadData()
    } //: ADD BUTTON
    
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
        guard let groupReceiver = groupReceiver else { return }
        groupNameTextField.text = groupReceiver.name
    } //: UPDATEVIEWS
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupReceiver?.people.count ?? 0
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        cell.selectionStyle         = .none
        
        let personDisplayed         = groupReceiver?.people[indexPath.row]
        
        var peopleCellConfig        = cell.defaultContentConfiguration()
        peopleCellConfig.text       = personDisplayed?.name
        cell.contentConfiguration   = peopleCellConfig
        

        return cell
    } //: CONFIG CELL
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let groupReceiver = groupReceiver else { return }
            let deleteThisPerson = groupReceiver.people[indexPath.row]
            PersonController.deletePerson(personToDelete: deleteThisPerson, from: groupReceiver)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE ROW
    } //: EDIT STYLE - DELETE

    
    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PersonDetailViewController {
                    let personToPass = groupReceiver?.people[index.row]
                    destination.personReceiver = personToPass
                } //: DESTINATION + OBJECT TO PASS/RECEIVE
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

} //: CLASS
