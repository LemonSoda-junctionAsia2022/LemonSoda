//
//  TestTimerView.swift
//  JunctionAsia_Lomon_Soda
//
//  Created by 김민택 on 2022/08/20.
//

import SwiftUI

struct TestTimerView: View {
    @State private var isPaused = false
    @State private var isShowing = false

    var body: some View {
        ZStack {
            if isPaused {
                Image("TestBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .transition(.move(edge: .trailing))
            }
            VStack {
                Button(action: {
                    isPaused.toggle()
                }, label: {
                    Text(isPaused ? "당장 멈춰" : "당장 움직여")
                })
            }
            .fullScreenCover(isPresented: $isShowing, content: { FullScreenPop() })
        }
        .onAppear {
            withAnimation(Animation.linear(duration: 1).speed(0.1)) {
                isPaused = true
            }
        }
    }
}

public extension Animation {
  static let instant = Animation.linear(duration: 0.0001)
}

public struct StoppableAnimationModifier<Value: VectorArithmetic>: AnimatableModifier {
    @Binding var binding: Value
    @Binding var paused: Bool

    public var animatableData: Value

    public init(binding: Binding<Value>, paused: Binding<Bool>) {
        _binding = binding
        _paused = paused
        animatableData = binding.wrappedValue
    }

    public func body(content: Content) -> some View {
        content
            .onChange(of: paused) { isPaused in
                if isPaused {
                    withAnimation(.instant) {
                        binding = animatableData
                    }
                }
            }
    }
}

