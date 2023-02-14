//
//  PersonListTableViewController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import UIKit

class PersonListTableViewController: UITableViewController {

    //MARK: - OUTLETS
    @IBOutlet weak var groupNameTextField: UITextField!
    @IBOutlet weak var favoritesOnlyToggle: UISwitch!
    
    
    //MARK: - PROPERTIES
    var groupReceiver: Group?
    private var filteredPeople: [Person] {
        if favoritesOnlyToggle.isOn {
            return groupReceiver?.people.filter { $0.isFavorites } ?? []
        } else {
            return groupReceiver?.people ?? []
        } //: CONDITION
    } //: COMPUTED PROPERTY
    
    
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
              let name          = groupNameTextField.text else { return }
        GroupController.sharedInstance.updateGroup(groupToUpdate: groupReceiver, newName: name)
    } //: WillDISAPPEAR
    
    
    //MARK: - ACTIONS
    
    @IBAction func addPersonButtonPressed(_ sender: Any) {
        guard let groupReceiver = groupReceiver else { return }
        PersonController.createPerson(group: groupReceiver)
        tableView.reloadData()
    } //: ADD TAPPED
    
    
    @IBAction func favoritesOnlyToggleTapped(_ sender: Any) {
        tableView.reloadData()
    } //: FAVORITES TAPPED
    
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
        guard let groupReceiver = groupReceiver else { return }
        groupNameTextField.text = groupReceiver.name
    } //: UPDATEVIEWS
    

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPeople.count
    } //: #ROWS

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath) as? PersonTableViewCell else { return UITableViewCell() }
        cell.selectionStyle     = .none
        
        let personObject = filteredPeople[indexPath.row]
        cell.person      = personObject
        cell.delegate    = self

        return cell
    } //: CONFIG CELL
    

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let groupReceiver = groupReceiver else { return }
            let deleteThisPerson = filteredPeople[indexPath.row]
            PersonController.deletePerson(personToDelete: deleteThisPerson, from: groupReceiver)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } //: DELETE ROW
    } //: EDIT STYLE - DELETE

    
    // MARK: - NAVIGATION
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPersonVC" {
            if let index = tableView.indexPathForSelectedRow {
                if let destination = segue.destination as? PersonDetailViewController {
                    let personToPass = filteredPeople[index.row]
                    destination.personReceiver = personToPass
                } //: DESTINATION + OBJECT TO PASS/RECEIVE
            } //: INDEX
        } //: IDENTIFIER
    } //: SEGUE

} //: CLASS


extension PersonListTableViewController: PersonTableViewCellDelegate {
    func toggleFavoriteButtonWasTapped(cell: PersonTableViewCell) {
        guard let personIndex = cell.person else { return }
        PersonController.toggleFavorites(person: personIndex)
        cell.udpateViews()
    } //: PROTOCOL IMPLEMENTATION
    
    
} //: EXTENSION
