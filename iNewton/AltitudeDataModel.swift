//
//  AltitudeViewModel.swift
//  CoreLocationTest
//
//  Created by 谷山卓朗 on 2020/12/21.
//

import Foundation
import Combine
import SwiftUI
import CoreMotion

class AltimatorManager: NSObject, ObservableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var altimeter:CMAltimeter?
    
    @Published var altitudeNumber:Double = 0
    @Published var altitudeString:String = ""
    @Published var altitudeFrom:Double = 0
    @Published var altitudeTo:Double = 0
    @Published var highestAltitude:Double = 0
    @Published var record:Double = 0
    @Published var recordString:String = ""
    
    override init() {
        super.init()
        altimeter = CMAltimeter()
        startUpdate()
    }
    
    func doReset(){
        altimeter?.stopRelativeAltitudeUpdates()
        startUpdate()
    }
    
    func startRecording(){
        altitudeFrom = self.altitudeNumber
    }
    
    func finishRecording(){
        altitudeTo = self.highestAltitude
        record = fabs(altitudeTo - altitudeFrom)
        if record >= 1.0 {
            self.recordString = String(format: "iPhone Throwing Record:%.2f m",record)
        } else if 1.0 > record && record >= 0.01 {
            self.recordString = String(format: "iPhone Throwing Record:%.2f cm",record * 100)
        } else {
            self.recordString = String(format: "iPhone Throwing Record:% mm",record * 100000)
        }
        
    }
    
    func startUpdate() {
        if(CMAltimeter.isRelativeAltitudeAvailable()) {
            altimeter!.startRelativeAltitudeUpdates(to: OperationQueue.main, withHandler:
                                                        {data, error in
                                                            if error == nil {
                                                                let altitude:Double = data!.relativeAltitude.doubleValue
                                                                if self.highestAltitude < altitude {
                                                                    self.highestAltitude = altitude
                                                                }
                                                                self.altitudeNumber = altitude
                                                                self.altitudeString = String(format: "高さ:%.5f m",altitude)
                                                                self.willChange.send()
                                                            }
                                                        })
        }
    }
    
}
