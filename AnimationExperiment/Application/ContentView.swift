//
//  ContentView.swift
//  AnimationExperiment
//
//  Created by Nuttapon Buaban on 14/9/2566 BE.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties

    let list: [ContentViewPage] = [
        ContentViewPage(title: "Solar system", view: SolarSystemAnimation())
    ]

    // MARK: View

    var body: some View {
        NavigationStack {
            List {
                ForEach(list, id: \.self) { list in
                    NavigationLink(list.title, value: list)
                }
            }
            .navigationDestination(for: ContentViewPage.self, destination: { list in
                AnyView(list.view)
            })
            .navigationTitle(Text("Animation Experiment"))
        }
    }
}

struct ContentViewPage: Hashable {
    var identifier: String {
        title
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }

    static func == (lhs: ContentViewPage, rhs: ContentViewPage) -> Bool {
        lhs.title == rhs.title
    }

    let title: String
    let view: any View
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
