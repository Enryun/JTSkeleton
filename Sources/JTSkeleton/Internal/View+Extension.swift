//
//  View+Extension.swift
//  CommonSwiftUI
//
//  Created by James Thang on 17/03/2024.
//

import SwiftUI

extension View {
    /// Applies a custom transformation to a view and returns the resulting view.
    ///
    /// This function allows for applying transformations conditionally based on the iOS version. It's particularly useful for modifying views with version-specific features or styles.
    ///
    /// - Parameter transform: A closure that takes the original view as an argument and returns the modified view.
    ///
    /// ## Simplified Usage with iOS Version Check:
    /// ```swift
    /// Text("Conditional Styling")
    ///     .apply {
    ///         if #available(iOS 16.0, *) {
    ///             $0.padding()
    ///         } else {
    ///             $0.padding().background(Color.gray)
    ///         }
    ///     }
    /// ```
    /// In this usage example, padding is applied universally, but a gray background is only applied if the iOS version is below 16.0.
    public func apply<Content>(@ViewBuilder _ transform: (Self) -> Content) -> Content {
        transform(self)
    }
    
    /// Extends `View` to conditionally use different `onChange` implementations based on iOS version.
    ///
    /// This function wraps the `onChange` modifier to handle changes to a value of any `Equatable` type, executing a closure upon change. It accommodates API differences between iOS versions by adjusting the method signature and behavior accordingly.
    ///
    /// - Parameters:
    ///   - value: The value to observe for changes. Must conform to `Equatable`.
    ///   - result: A closure that is executed when the observed value changes.
    ///
    /// ## Example Usage:
    /// ```swift
    /// Text("Example")
    ///     .customChange(value: someObservableValue) { newValue in
    ///         print("Value changed to \(newValue)")
    ///     }
    /// ```
    ///
    /// Use this function to seamlessly handle value changes across different iOS versions with custom logic in the closure.
    @ViewBuilder
    public func customChange<T: Equatable>(value: T, result: @escaping (T) -> ()) -> some View {
        if #available(iOS 17, *) {
            self.onChange(of: value) { oldValue, newValue in
                result(newValue)
            }
        } else {
            self.onChange(of: value) { newValue in
                result(newValue)
            }
        }
    }
    
}
