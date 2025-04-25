//
//  ShimmerEffect.swift
//  ShimmerAnimationEffect
//
//  Created by user on 3/16/23.
//

import SwiftUI

// Shimmer Effect Helper
struct ShimmerEffectHelper: ViewModifier {
    // Shimmer Config
    var config: ShimmerConfig
    // Animation Properties
    @State private var moveTo: CGFloat = -0.7
    
    func body(content: Content) -> some View {
        content
            .apply {
                if config.redacted {
                    $0.hidden()
                } else {
                    $0
                }
            }
            .overlay {
                // Changing Tint Color
                Rectangle()
                    .fill(config.tint)
                    .mask {
                        content
                    }
                    .overlay {
                        // Shimmer
                        GeometryReader {
                            let size = $0.size
                            let extraOffset = size.height / 2.5
                            
                            Rectangle()
                                .fill(config.highlight)
                                .mask {
                                    Rectangle()
                                        // Gradient for Glowing at the Center
                                        .fill(.linearGradient(colors: [.white.opacity(0), config.highlight.opacity(config.highlightOpacity), .white.opacity(0)], startPoint: .top, endPoint: .bottom))
                                        // Adding Blur
                                        .blur(radius: config.blur)
                                        // Rotating your choice of wish
                                        .rotationEffect(.init(degrees: -70))
                                        // Moving to the Start
                                        .offset(x: moveTo > 0 ? extraOffset : -extraOffset)
                                        .offset(x: size.width * moveTo)
                                }
                        }
                        // Mask with the Content
                        .mask {
                            content
                        }
                    }
                    // Animating Movement
                    .onAppear {
                        DispatchQueue.main.async {
                            moveTo = 0.7
                        }
                    }
                    .animation(.linear(duration: config.speed).repeatForever(autoreverses: false), value: moveTo)
            }
    }
}
