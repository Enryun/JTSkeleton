//
//  Speed.swift
//  CommonSwiftUI
//
//  Created by James Thang on 09/06/2024.
//

import SwiftUI

/// An enumeration representing the speed of an operation.
///
/// This enum provides both predefined and customizable time intervals to represent different speeds at which an operation can occur. Each case of the enum corresponds to a specific speed, with four predefined speeds and one customizable option, allowing for flexible loading behavior tailored to specific needs.
///
/// - Cases:
///   - flash: A very fast operation speed, with a time interval of 0.1 second.
///   - fast: A fast operation speed, with a time interval of 1 second.
///   - medium: A medium operation speed, with a time interval of 2 seconds.
///   - slow: A slow operation speed, with a time interval of 3 seconds.
///   - custom(TimeInterval): A customizable operation speed, where the time interval can be specified dynamically.
public enum Speed {
    case flash
    case fast
    case medium
    case slow
    case custom(TimeInterval)

    var timeInterval: TimeInterval {
        switch self {
        case .flash:
            return 0.1
        case .fast:
            return 1
        case .medium:
            return 2
        case .slow:
            return 3
        case .custom(let interval):
            return interval
        }
    }
}
