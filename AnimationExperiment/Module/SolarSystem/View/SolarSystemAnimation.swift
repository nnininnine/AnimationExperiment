//
//  SolarSystemAnimation.swift
//  AnimationExperiment
//
//  Created by Nuttapon Buaban on 14/9/2566 BE.
//

import SwiftUI

struct SolarSystemAnimation: View {
    // MARK: Properties

    @State var isAnimating: Bool = false

    @State var planets: [Planet] = [
        Planet(
            title: "Sun",
            size: 56,
            offset: 0,
            color: .red,
            animation: .linear(duration: 0)),
        Planet(
            title: "Mercury",
            size: 5,
            offset: 36,
            color: .gray,
            animation: .linear(duration: 1.2)),
        Planet(
            title: "Venus",
            size: 10,
            offset: 48,
            color: .orange,
            animation: .linear(duration: 1.8)),
        Planet(
            title: "Earth",
            size: 10,
            offset: 64,
            color: .green,
            animation: .linear(duration: 2)),
        Planet(
            title: "Mars",
            size: 8,
            offset: 80,
            color: .red,
            animation: .linear(duration: 4)),
        Planet(
            title: "Jupiter",
            size: 48,
            offset: 120,
            color: .gray,
            animation: .linear(duration: 6)),
        Planet(
            title: "Saturn",
            size: 40,
            offset: 168,
            color: .orange,
            animation: .linear(duration: 8)),
        Planet(
            title: "Uranus",
            size: 28,
            offset: 210,
            color: .teal,
            animation: .linear(duration: 9)),
        Planet(
            title: "Neptune",
            size: 32,
            offset: 256,
            color: .purple,
            animation: .linear(duration: 10)),
    ]

    // MARK: View

    var body: some View {
        ZStack {
            ForEach(planets, id: \.self) { planet in
                Circle()
                    .stroke(Color.white.opacity(0.3), style: .init(dash: [3, 6]))
                    .frame(width: calculateOrbitSize(planet: planet))
                Circle()
                    .fill(planet.color)
                    .frame(width: planet.size)
                    .offset(x: planet.offset)
                    .rotationEffect(.degrees(isAnimating ? 0 : 360))
                    .animation(planet.animation.repeatForever(autoreverses: false), value: isAnimating)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black)
        .navigationTitle("Solar System")
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(Color.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .onAppear {
            DispatchQueue.main.async {
                isAnimating = true
            }
        }
    }

    // MARK: Methods

    func calculateOrbitSize(planet: Planet) -> Double {
        return 2 * planet.offset
    }
}

struct SolarSystemAnimation_Previews: PreviewProvider {
    static var previews: some View {
        SolarSystemAnimation()
    }
}
