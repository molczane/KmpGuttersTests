package com.example.kmpgutterstests.shared

/**
 * Callback interface - commonly implemented in Swift
 */
interface EventHandler {
    /**
     * Called when an event occurs
     */
    fun onEvent(eventName: String, payload: Map<String, Any>?)

    /**
     * Called on error
     */
    fun onError(error: Throwable)
}

/**
 * Delegate pattern interface
 */
interface ViewDelegate {
    fun viewDidLoad()
    fun viewWillAppear()
    fun viewDidDisappear()
}