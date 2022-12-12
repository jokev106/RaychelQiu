//
//  CoreDataManager.swift
//  RaychelQiu
//
//  Created by Jonathan Valentino on 30/11/22.
//

import CoreData
import Foundation

class CoreDataManager {
    static let instance = CoreDataManager()
    let container = NSPersistentContainer(name: "RaychelQiu")
    private var models = [SaveChapter]()

    init() {
        container.loadPersistentStores { _, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }

    func initChapter() {
        let context = container.viewContext

        for index in 0 ..< 6 {
            if index == 0 {
                let newItem = SaveChapter(context: context)
                newItem.chapter = Int16(index)
                newItem.status = "playable"
                print(newItem.id)

            } else if index > 0, index < 3 {
                let newItem = SaveChapter(context: context)
                newItem.chapter = Int16(index)
                newItem.status = "locked"
                print(newItem.id)

            } else {
                let newItem = SaveChapter(context: context)
                newItem.chapter = Int16(index)
                newItem.status = "soon"
                print(newItem.id)
            }
        }

        do {
            try context.save()
        } catch {
            print("Failed to save context \(error)")
        }
    }

    func editChapter(chapter: Int) {
        let fetchRequest: NSFetchRequest<SaveChapter> = SaveChapter.fetchRequest()
        let context = container.viewContext

        do {
            models = try context.fetch(fetchRequest)
            models = models.filter { $0.chapter == chapter }
            models[0].status = "playable"

            try context.save()
        } catch {
            print("Failed to edit context \(error)")
        }
    }

    func loadChapter() -> [SaveChapter] {
        let fetchRequest: NSFetchRequest<SaveChapter> = SaveChapter.fetchRequest()

        do {
            models = try container.viewContext.fetch(fetchRequest)
            models = models.sorted(by: { $0.chapter < $1.chapter })
            return models

        } catch {
            return []
        }
    }
}
