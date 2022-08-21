//
//  CoreDataManager.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 김민택 on 2022/08/21.
//

import CoreData
import Foundation

let coreDataManager = CoreDataManager()

class CoreDataManager {
    
    @Published var likeds = [Liked]()
    
    func createLikeData(jsonObject: UnitDatum) {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        let newItem = Liked(context: viewContext)
//        newItem.nid = Int32(jsonObject.id)
        newItem.nftImage = jsonObject.imageURL
        newItem.nftName = jsonObject.name
//        newItem.nftDescription = jsonObject.unitDatumDescription
        newItem.creator = jsonObject.creator.user?.username
        newItem.isLiked = true
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func deleteLikeData(coreObject: Liked) {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        coreObject.setValue(false, forKey: "isLiked")
        
        do {
            try viewContext.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
