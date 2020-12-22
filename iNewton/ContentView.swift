//
//  ContentView.swift
//  iNewton
//
//

import SwiftUI
import SpriteKit

struct ContentView: View {
    var scene: SKScene {
        let scene = TopScene(size: CGSize(width: 375, height: 570))
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
                        .font(.custom("default", size: 70))
                    ,alignment: .top)
                //                .overlay(
                //                    Image("title2")
                //                        .ignoresSafeArea(edges: .top)
                //                    ,alignment: .top)
                .overlay(
                    NavigationLink(destination: AltitudeView()) {
                        //                        Text("Throw")
                        //                            .foregroundColor(.gray)
                        //                            .font(.largeTitle)
                        Image("PlayButton")
                            .resizable()
                            .frame(width: 170.0, height: 80.0)
                            // 枠線を10pxで描画する
                            .border(Color.white, width: 10)
                            // Imageに対して角丸を描画する
                            .cornerRadius(30)
                    }
                    .offset(y: -100),
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
