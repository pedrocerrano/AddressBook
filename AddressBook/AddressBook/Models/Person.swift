//
//  Person.swift
//  AddressBook
//
//  Created by iMac Pro on 2/13/23.
//

import Foundation

class Person: Codable {
    var id = UUID()
    var name: String
    var address: String
    
    init(name: String, address: String) {
        self.name = name
        self.address = address
    } //: MEMBERWISE INIALIZER
    
} //: CLASS


extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        return lhs.id == rhs.id
    } //: EQUALtoSELF
} //: EXTENSTION
