//
//  PersonDetailViewController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    //MARK: - OUTLETS
    @IBOutlet weak var personNameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var personFavoriteButton: UIBarButtonItem!
    
    
    //MARK: - PROPERTIES
    var personReceiver: Person?
    
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    } //: DidLOAD
    
    
    //MARK: - ACTIONS
    @IBAction func saveButtonPressed(_ sender: Any) {
        guard let personReceiver = personReceiver,
              let name = personNameTextField.text,
              let address = addressTextField.text else { return }
        PersonController.updatePerson(person: personReceiver, newName: name, newAddress: address)
        
        navigationController?.popViewController(animated: true)
    } //: SAVE TAPPED
    
    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        guard let personReceiver = personReceiver else { return }
        
        PersonController.toggleFavorites(person: personReceiver)
        updateFavoriteButton()
    } //: FAVORITE TAPPED
    
    
    //MARK: - HELPER FUNCTIONS
    func updateViews() {
        guard let personReceiver    = personReceiver else { return }
        personNameTextField.text    = personReceiver.name
        addressTextField.text       = personReceiver.address
        
        updateFavoriteButton()
    } //: UPDATEVIEWS
    
    
    func updateFavoriteButton() {
        guard let personReceiver = personReceiver else { return }
        
        let favoriteImageName       = personReceiver.isFavorites ? "star.fill" : "star"
        let favoriteImage           = UIImage(systemName: favoriteImageName)
        personFavoriteButton.image  = favoriteImage
    } //: UPDATE FAVORITES
    
} //: CLASS
