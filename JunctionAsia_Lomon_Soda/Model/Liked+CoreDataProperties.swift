//
//  Liked+CoreDataProperties.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 김민택 on 2022/08/21.
//
//

import Foundation
import CoreData


extension Liked {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Liked> {
        return NSFetchRequest<Liked>(entityName: "Liked")
    }

    @NSManaged public var nftImage: String?
    @NSManaged public var nftName: String?
    @NSManaged public var creator: String?
    @NSManaged public var permalink: String?
    @NSManaged public var isLiked: Bool

}

extension Liked : Identifiable {

}
