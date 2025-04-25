//
//  ShimmerLoadingView.swift
//  CommonSwiftUI
//
//  Created by James Thang on 22/03/2024.
//

import SwiftUI

extension View {
    /// Applies a shimmer effect to any SwiftUI view, enhancing the UI with a dynamic loading indicator.
    ///
    /// This function overlays a shimmer animation over the view it modifies, typically used as a placeholder during content loading. The effect can be extensively customized to match your app's style.
    ///
    /// - Parameters:
    ///   - tint: The background color of the shimmer.
    ///   - highlight: The color of the shimmering highlight.
    ///   - blur: The amount of blur applied to the shimmer effect. Default is 0.
    ///   - highlightOpacity: The opacity of the shimmer highlight. Default is 1.
    ///   - speed: The speed of the shimmer effect, with a default of .medium (2 seconds).
    ///   - redacted: A Boolean value that indicates whether the view's content should be redacted during the shimmer effect. Default is false.
    ///
    /// ## Usage:
    /// ```swift
    /// Text("Loading...")
    ///     .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
    /// ```
    /// Customize the parameters to fit the style and functionality of your app's loading indicators, with optional content redaction for enhanced visual effect.
    @ViewBuilder
    public func shimmer(tint: Color, highlight: Color, blur: CGFloat = 0, highlightOpacity: CGFloat = 1, speed: Speed = .medium, redacted: Bool = false) -> some View {
        let config = ShimmerConfig(tint: tint, highlight: highlight, blur: blur, highlightOpacity: highlightOpacity, speed: speed.timeInterval, redacted: redacted)
        self.modifier(ShimmerEffectHelper(config: config))
    }
    
    /// Applies a conditional shimmer effect to any SwiftUI view based on an active state.
    ///
    /// This function overlays a shimmer animation on the calling view when `isActive` is true. It's useful for placeholder effects during content loading. The shimmer's appearance can be customized with colors, opacity, speed, and optional redaction.
    ///
    /// - Parameters:
    ///   - isActive: A `Binding<Bool>` that controls whether the shimmer effect is active.
    ///   - tint: The background color of the shimmer.
    ///   - highlight: The color of the shimmering highlight.
    ///   - blur: The amount of blur applied to the shimmer effect, with a default of 0.
    ///   - highlightOpacity: The opacity of the shimmer highlight, defaulting to 1.
    ///   - speed: The speed of the shimmer animation, with `.medium` as the default.
    ///   - redacted: A Boolean that indicates whether the view should show a redacted placeholder state.
    ///
    /// ## Usage:
    /// ```swift
    /// Text("Loading...")
    ///     .shimmer(isActive: $isLoading, tint: .gray.opacity(0.3), highlight: .white, blur: 5)
    /// ```
    /// Adjust the parameters to fit the style of your app's loading indicators, toggling the effect based on the application state.
    @ViewBuilder
    public func shimmer(isActive: Binding<Bool>, tint: Color, highlight: Color, blur: CGFloat = 0, highlightOpacity: CGFloat = 1, speed: Speed = .medium, redacted: Bool = false) -> some View {
        if isActive.wrappedValue {
            let config = ShimmerConfig(tint: tint, highlight: highlight, blur: blur, highlightOpacity: highlightOpacity, speed: speed.timeInterval, redacted: redacted)
            self.modifier(ShimmerEffectHelper(config: config))
        } else {
            self
        }
    }
    
}
