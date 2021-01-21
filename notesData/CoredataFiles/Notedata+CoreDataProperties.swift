//
//  Notedata+CoreDataProperties.swift
//  notesData
//
//  Created by bhargava on 15/01/21.
//
//

import Foundation
import CoreData


extension Notedata {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notedata> {
        return NSFetchRequest<Notedata>(entityName: "Notedata")
    }

    @NSManaged public var createdata: String?
    @NSManaged public var createdate: Date?

}

extension Notedata : Identifiable {

}
