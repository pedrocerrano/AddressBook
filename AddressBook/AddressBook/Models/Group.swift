//
//  Group.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import Foundation

class Group {
    let id = UUID()
    var name: String
    var people: [Person]
    
    init(name: String, people: [Person] = []) {
        self.name = name
        self.people = people
    } //: MEMBERWISE INITIALIZER
    
} //: CLASS


extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    } //: EQUALtoSELF
    
} //: EXTENSION
