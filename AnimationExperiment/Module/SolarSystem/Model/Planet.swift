//
//  Plannet.swift
//  AnimationExperiment
//
//  Created by Nuttapon Buaban on 15/9/2566 BE.
//

import Foundation
import SwiftUI

struct Planet: Hashable {
    // MARK: Static

    static func == (lhs: Planet, rhs: Planet) -> Bool {
        lhs.identifier == rhs.identifier
    }

    // MARK: Properties

    var identifier: String {
        title
    }

    let title: String
    let size: Double
    let offset: Double
    let color: Color
    let animation: Animation

    // MARK: Methods

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}
