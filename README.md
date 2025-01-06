# Swift Asynchronous Function Race Condition and Memory Leak

This repository demonstrates a potential race condition and memory leak in a Swift asynchronous function. The `fetchData` function uses a completion handler to return data asynchronously. However, if the function completes before the asynchronous task, a memory leak can occur, and the completion handler may never be executed.

## Bug

The `bug.swift` file contains the buggy code. The `fetchData` function simulates a network request using `DispatchQueue.global().asyncAfter`. If a random boolean is false, it throws an error, otherwise it returns an array of strings. The issue lies in the potential for the function to be deallocated before the completion handler is executed.

## Solution

The `bugSolution.swift` file provides a solution using `weak self` to prevent memory leaks in a completion handler for an asynchronous operation. This prevents strong reference cycles.