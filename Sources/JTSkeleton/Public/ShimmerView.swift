//
//  ShimmerView.swift
//  CommonSwiftUI
//
//  Created by James Thang on 18/06/2024.
//

import SwiftUI

/// A view displaying a shimmering loading placeholder.
///
/// This view simulates a 'shimmer' effect commonly used as a placeholder during content loading. It consists of multiple shimmering elements: a pair of small circular views at the top and bottom, and larger rectangular views in between, all showcasing the shimmer effect.
///
/// ## Usage:
/// Simply initialize and place this view where content is loading:
/// ```swift
/// ShimmerView()
/// ```
///
/// No additional configuration is needed. The shimmer effect starts automatically, simulating content loading in your UI.
public struct ShimmerView: View {
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            smallLoadingView
            smallLoadingView
            RoundedRectangle(cornerRadius: 10)
                .frame(idealHeight: 180)
                .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
            smallLoadingView
            smallLoadingView
            RoundedRectangle(cornerRadius: 10)
                .frame(idealHeight: 180)
                .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
        }
    }
    
    var smallLoadingView: some View {
        HStack {
            Circle()
                .frame(width: 55, height: 55)
            
            VStack(alignment: .leading, spacing: 6) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 50)
                
                RoundedRectangle(cornerRadius: 4)
                    .frame(height: 10)
                    .padding(.trailing, 100)
            }
        }
        .shimmer(tint: .gray.opacity(0.3), highlight: .white, blur: 5, redacted: true)
    }
}
