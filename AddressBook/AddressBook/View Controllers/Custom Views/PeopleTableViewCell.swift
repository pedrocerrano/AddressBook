//
//  PeopleTableViewCell.swift
//  AddressBook
//
//  Created by iMac Pro on 2/14/23.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {

    //MARK: - OUTLETS
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var personIsFavoriteButton: UIButton!
    
    
    //MARK: - PROPERTIES
    var person: Person? {
        didSet {
            udpateViews()
        } //: PROPERTY OBSERVER
    } //: COMPUTED
    
    
    //MARK: - HELPER FUNCTIONS
    func udpateViews() {
        guard let person = person else { return }
        personNameLabel.text    = person.name
        
        let favoriteImageName   = person.isFavorites ? "star.fill" : "star"
        let favoriteImage       = UIImage(systemName: favoriteImageName)
        personIsFavoriteButton.setImage(favoriteImage, for: .normal)
    }  //: UPDATE VIEWS
    
    
    //MARK: - ACTIONS
    @IBAction func personFavoriteButtonTapped(_ sender: Any) {
        
    } //: FAVORITE TAPPED
    
} //: CLASS
