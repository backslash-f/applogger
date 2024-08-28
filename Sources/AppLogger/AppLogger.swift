//
//  AppLogger.swift
//  AppLogger
//
//  Created by Fernando Fernandes on 29.06.20.
//

import Foundation
import os

/// Logs app info by using the newest Swift unified logging APIs.
///
/// Reference:
///  - [Explore logging in Swift (WWDC20)](https://developer.apple.com/wwdc20/10168)
///  - [Unified Logging](https://developer.apple.com/documentation/os/logging)
///  - [OSLog](https://developer.apple.com/documentation/os/oslog)
///  - [Logger](https://developer.apple.com/documentation/os/logger)
public struct AppLogger {

    // MARK: - Properties

    /// Default values used by the `AppLogger`.
    public struct Defaults {
        public static let subsystem = Bundle.main.bundleIdentifier ?? "AppLogger"
        public static let category = "default"
        public static let isPrivate = false
    }

    // MARK: - Private Properties

    private let logger: Logger

    // MARK: - Lifecycle

    /// Creates an `AppLogger` instance.
    ///
    /// - Parameters:
    ///   - subsystem: `String`. Organizes large topic areas within the app or apps. For example, you might define
    ///   a subsystem for each process that you create. The default is `Bundle.main.bundleIdentifier ?? "AppLogger"`.
    ///   - category: `String`. Within a `subsystem`, you define categories to further distinguish parts of that
    ///   subsystem. For example, if you used a single subsystem for your app, you might create separate categories for
    ///   model code and user-interface code. In a game, you might use categories to distinguish between physics, AI,
    ///   world simulation, and rendering. The default is `default`.
    public init(subsystem: String = Defaults.subsystem, category: String = Defaults.category) {
        self.logger = Logger(subsystem: subsystem, category: category)
    }
}

// MARK: - Interface

public extension AppLogger {
    
    /// Logs a string interpolation at the given level.
    ///
    /// Notice that `.debug` won't work with simulators (nothing is shown in the Console app for this level),
    /// but works fine with physical devices. This is a known issue:
    /// https://stackoverflow.com/a/58814535/584548
    ///
    /// - Parameters:
    ///   - level: `OSLogType`; default is `.debug`.
    ///   - message: The `String` to be logged.
    ///   - isPrivate: Sets the `OSLogPrivacy` to be used by the function. `true` means `.private`;
    ///   `false` means `.public`. The default is `false`.
    func log(level: OSLogType = .debug, _ message: String, isPrivate: Bool = Defaults.isPrivate) {
        if isPrivate {
            logger.log(level: level, "\(message, privacy: .private)")
        } else {
            logger.log(level: level, "\(message, privacy: .public)")
        }
    }
}

