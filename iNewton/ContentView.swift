//
//  ContentView.swift
//  iNewton
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TopView()
            .statusBar(hidden: true)
            .preferredColorScheme(.light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
