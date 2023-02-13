//
//  GroupController.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import Foundation

class GroupController {
    
    static let sharedInstance = GroupController()
    var groups: [Group] = []
    
    //MARK: - INITIALIZERS
    init() {
        loadContactsFromDisk()
    }
    
    
    //MARK: - CRUD FUNCTIONS
    func createGroup(with name: String = "Untitled Group", people: [Person] = []) {
        let newGroup = Group(name: name)
        groups.append(newGroup)
        
        saveContactsToDisk()
    } //: CREATE
    
    
    func updateGroup(groupToUpdate: Group, newName: String) {
        groupToUpdate.name = newName
        
        saveContactsToDisk()
    } //: UPDATE
    
    
    func deleteGroup(group groupToDelete: Group) {
        guard let groupIndex = groups.firstIndex(of: groupToDelete) else { return }
        groups.remove(at: groupIndex)
        
        saveContactsToDisk()
    } //: DELETE

    
    //MARK: - PERSISTENCE
    func saveContactsToDisk() {
        guard let url = fileURL else { return }
        do {
            let data = try JSONEncoder().encode(groups)
            try data.write(to: url)
        } catch let error {
            print(error.localizedDescription)
        } //: DO-CATCH
    } //: SAVE
    
    
    func loadContactsFromDisk() {
        guard let url = fileURL else { return }
        do {
            let retreivedData   = try Data(contentsOf: url)
            let decodedGroups   = try JSONDecoder().decode([Group].self, from: retreivedData)
            self.groups         = decodedGroups
        } catch let error {
            print(error.localizedDescription)
        } //: DO-CATCH
    } //: LOAD
    
    
    //MARK: - COMPUTED PROPERTY
    private var fileURL: URL? {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let finalURL = documentsDirectory.appendingPathComponent("addressbook.json")
        
        return finalURL
    } //: COMPUTED PROPERTY
    
} //: CLASS
