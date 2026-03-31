//
// Created by Ernest Molczan on 31/03/2026.
//

import Foundation
import Shared

/// Example 1: one class conforms to both a Swift protocol and Kotlin interface.
class DualContractRepository: Repository, SwiftRepositoryContract {

    private var storage: [String: String] = [:]

    // Go to Super should navigate to Repository.fetchData in Kotlin.
    func fetchData(id: String) -> String {
        storage[id] ?? ""
    }

    // Go to Super should navigate to Repository.saveData in Kotlin.
    func saveData(key: String, value: String) -> Bool {
        storage[key] = value
        return true
    }

    // Go to Super should navigate to Repository.deleteData in Kotlin.
    func deleteData(id: String) -> Bool {
        storage.removeValue(forKey: id) != nil
    }
}