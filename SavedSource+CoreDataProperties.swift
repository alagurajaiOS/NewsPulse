//
//  SavedSource+CoreDataProperties.swift
//  News Pulse
//
//  Created by alagu-16152 on 01/07/24.
//
//

import Foundation
import CoreData


extension SavedSource {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedSource> {
        return NSFetchRequest<SavedSource>(entityName: "SavedSource")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var news: UserSavedNews?

}

extension SavedSource : Identifiable {

}
