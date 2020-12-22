//
//  ContentView.swift
//  iNewton
//
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = TopScene()
        scene.size = CGSize(width: 375, height: 570)
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        NavigationView {
            SpriteView(scene: scene)
                .frame(width: 375, height: 570)
                .edgesIgnoringSafeArea(.all)
                .overlay(
                    Text("iNewton")
                        .foregroundColor(.gray)
                        .font(.largeTitle)
                    ,alignment: .top)
                //                .overlay(
                //                    Image("title2")
                //                        .ignoresSafeArea(edges: .top)
                //                    ,alignment: .top)
                .overlay(
                    NavigationLink(destination: AltitudeView()) {
                        Image("PlayButton")
                            .resizable()
                            .frame(width: 130.0, height: 60.0)
                    }
                    .offset(y: -70),
                    alignment: .bottom)
                .statusBar(hidden: true)
            
            //        TopView()
            //            .statusBar(hidden: true)
            //            .preferredColorScheme(.light)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
