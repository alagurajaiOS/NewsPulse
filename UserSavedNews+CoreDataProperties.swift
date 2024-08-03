//
//  UserSavedNews+CoreDataProperties.swift
//  News Pulse
//
//  Created by alagu-16152 on 01/07/24.
//
//

import Foundation
import CoreData


extension UserSavedNews {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserSavedNews> {
        return NSFetchRequest<UserSavedNews>(entityName: "UserSavedNews")
    }

    @NSManaged public var content: String?
    @NSManaged public var newsDescription: String?
    @NSManaged public var publishedAt: String?
    @NSManaged public var title: String?
    @NSManaged public var url: URL?
    @NSManaged public var urlToImage: URL?
    @NSManaged public var source: SavedSource?

}

extension UserSavedNews : Identifiable {

}
