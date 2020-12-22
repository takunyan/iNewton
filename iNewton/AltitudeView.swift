//
//  AltitudeView.swift
//  CoreLocationTest
//
//  Created by 谷山卓朗 on 2020/12/21.
//

import SwiftUI
import CoreMotion

struct AltitudeView: View {
    @ObservedObject var manager = AltimatorManager()
    
    let availabe = CMAltimeter.isRelativeAltitudeAvailable()
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 30) {
                Text("\(manager.altitudeNumber)")
                Text(availabe ? manager.altitudeString : "----")
                Text("開始高度：\(manager.altitudeFrom)")
                Text("最高高度:\(manager.highestAltitude)")
                Text("終了高度：\(manager.altitudeTo)")
                Text("差：\(manager.record)")
                Text(manager.recordString)
                
            }
            HStack(spacing: 30) {
                Button(action: {
                    self.manager.startRecording()
                }) {
                    Text("開始")
                }
                Button(action: {
                    self.manager.finishRecording()
                   
                }) {
                    Text("終了")
                }
                Button(action: {
                    self.manager.doReset()
                }) {
                    Text("リセット")
                }
            }
        }
    }
}

struct AltitudeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
