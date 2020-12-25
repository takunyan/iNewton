//
//  AltitudeView.swift
//  CoreLocationTest
//
//

import SwiftUI
import CoreMotion
import SpriteKit

struct AltitudeView: View {
    @ObservedObject var manager = AltimatorManager()
    
    let availabe = CMAltimeter.isRelativeAltitudeAvailable()
    
//    var appleScene: SKScene {
//        let scene = AppleThrownScene(size: CGSize(width: 375, height: 570))
//        scene.scaleMode = .fill
//        scene.backgroundColor = .white
//        return scene
//    }
    
    var body: some View {
        
//        SpriteView(scene: appleScene)
//                        .frame(width: 375, height: 570)
//                        .edgesIgnoringSafeArea(.all)
//            .overlay(
//                VStack(spacing: 30) {
//                            VStack(spacing: 30) {
//                //                Text("\(manager.altitudeNumber)")
//                //                Text(availabe ? manager.altitudeString : "----")
//                //                Text("開始高度：\(manager.altitudeFrom)")
//                //                Text("最高高度:\(manager.highestAltitude)")
//                //                Text("終了高度：\(manager.altitudeTo)")
//                //                Text("差：\(manager.record)")
//                                Text(manager.recordString)
//                                    .foregroundColor(.gray)
//                                    .font(.custom("default", size: 60))
//
//
//                            }
//                            Spacer()
//                            HStack(spacing: 30) {
//                                Button(action: {
//                                    self.manager.startRecording()
//                                }) {
//                                    Text("開始")
//                                        .foregroundColor(Color.red)
//                                }
//                                .padding(.all)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.red, lineWidth: 1)
//                                )
//                                Button(action: {
//                                    self.manager.finishRecording()
//
//                                }) {
//                                    Text("終了")
//                                        .foregroundColor(Color.red)
//                                }
//                                .padding(.all)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.red, lineWidth: 1)
//                                )
//                                Button(action: {
//                                    self.manager.doReset()
//                                }) {
//                                    Text("リセット")
//                                        .foregroundColor(Color.red)
//                                }
//                                .padding(.all)
//                                .overlay(
//                                    RoundedRectangle(cornerRadius: 10)
//                                        .stroke(Color.red, lineWidth: 1)
//                                )
//                            }
//                            .offset(y: -100)
//                }
//                ,alignment: .top)
        VStack(spacing: 30) {
            VStack(spacing: 30) {
//                Text("\(manager.altitudeNumber)")
//                Text(availabe ? manager.altitudeString : "----")
//                Text("開始高度：\(manager.altitudeFrom)")
//                Text("最高高度:\(manager.highestAltitude)")
//                Text("終了高度：\(manager.altitudeTo)")
//                Text("差：\(manager.record)")
                Text(manager.recordString)
                    .foregroundColor(.gray)
                    .font(.custom("default", size: 60))


            }
            Spacer()
            HStack(spacing: 30) {
                Button(action: {
                    self.manager.startRecording()
                }) {
                    Text("開始")
                        .foregroundColor(Color.red)
                }
                .padding(.all)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 1)
                )
                Button(action: {
                    self.manager.finishRecording()

                }) {
                    Text("終了")
                        .foregroundColor(Color.red)
                }
                .padding(.all)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 1)
                )
                Button(action: {
                    self.manager.doReset()
                }) {
                    Text("リセット")
                        .foregroundColor(Color.red)
                }
                .padding(.all)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red, lineWidth: 1)
                )
            }
            .offset(y: -20)
        }
        .preferredColorScheme(.light)
    }
}

struct AltitudeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
