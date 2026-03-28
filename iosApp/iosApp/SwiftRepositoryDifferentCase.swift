//
// Created by Ernest Molczan on 28/03/2026.
//

import Foundation
import Shared

/// Implementation of inherited interface
class SwiftCacheableRepository: CacheableRepository {

    private var storage: [String: String] = [:]
    private var cache: Set<String> = []

    // Should navigate to Repository.fetchData (parent interface in Kotlin)
    func fetchData(id: String) -> String {
        return storage[id] ?? ""
    }

    // Should navigate to Repository.saveData (parent interface in Kotlin)
    func saveData(key: String, value: String) -> Bool {
        storage[key] = value
        cache.insert(key)
        return true
    }

    // Should navigate to Repository.deleteData (parent interface in Kotlin)
    func deleteData(id: String) -> Bool {
        cache.remove(id)
        return storage.removeValue(forKey: id) != nil
    }

    // Should navigate to CacheableRepository.clearCache in Kotlin
    func clearCache() {
        cache.removeAll()
    }

    // Should navigate to CacheableRepository.isCached in Kotlin
    func isCached(id: String) -> Bool {
        return cache.contains(id)
    }
}

/// Swift protocol with signatures matching the Kotlin Repository interface.
protocol SwiftRepositoryContract {
    func fetchData(id: String) -> String
    func saveData(key: String, value: String) -> Bool
    func deleteData(id: String) -> Bool
}

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