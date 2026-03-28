package com.example.kmpgutterstests.shared


data class Sth(val id: String, val name: String)

/**
 * This interface will be exported as an Objective-C protocol.
 * Swift implementations should be able to navigate back to these method declarations.
 */
interface Repository {
    /**
     * Fetches data by ID.
     * Navigation from Swift implementation should lead here.
     */
    fun fetchData(id: String): String

    /**
     * Saves data with the given key.
     * Navigation from Swift implementation should lead here.
     */
    fun saveData(key: String, value: String): Boolean

    /**
     * Deletes data by ID.
     * Navigation from Swift implementation should lead here.
     */
    fun deleteData(id: String): Boolean
}

/**
 * Another interface with generics and suspend functions
 */
interface DataService {
    /**
     * Async data loading - exported with completion handler
     */
    suspend fun loadItems(): List<String>

    /**
     * Property that Swift should also navigate to
     */
    val serviceName: String
}

/**
 * Interface with inheritance
 */
interface CacheableRepository : Repository {
    /**
     * Clears the cache
     */
    fun clearCache()

    /**
     * Checks if item is cached
     */
    fun isCached(id: String): Boolean
}

/**
 * Kotlin interface with a mutable property and an extra operation.
 * This is useful for testing Swift protocol refinement over Kotlin-exported protocols.
 */
interface MutableRepository : Repository {
    /**
     * Human-readable label visible in Swift as a read-write property.
     */
    var repositoryLabel: String

    /**
     * Clears all stored data.
     */
    fun resetStorage()
}

/**
 * Protocol-composition test interfaces:
 * these are intentionally small and overlapping to verify Swift `A & B` behavior.
 */
interface KotlinComposeA {
    fun compose(id: String): String
}

interface KotlinComposeB {
    fun compose(id: String): String
}

interface KotlinComposeChild : KotlinComposeA

interface KotlinLabelled {
    val label: String
}
