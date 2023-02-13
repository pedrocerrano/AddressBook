//
//  PersonController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import Foundation

class PersonController {
    
    //MARK: - CRUD FUNCTIONS
    static func createPerson(name: String = "New Contact", address: String = "", group: Group) {
        let newPerson = Person(name: name, address: address)
        group.people.append(newPerson)
        
        GroupController.sharedInstance.saveContactsToDisk()
    } //: CREATE
    
    
    static func updatePerson(person: Person, newName: String, newAddress: String) {
        person.name     = newName
        person.address  = newAddress
        
        GroupController.sharedInstance.saveContactsToDisk()
    } //: UPDATE
    
    
    static func deletePerson(personToDelete: Person, from group: Group) {
        guard let personIndex = group.people.firstIndex(of: personToDelete) else { return }
        group.people.remove(at: personIndex)

        GroupController.sharedInstance.saveContactsToDisk()
    } //: DELETE
    
} //: CLASS
