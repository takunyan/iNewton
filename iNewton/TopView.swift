//
//  TopView.swift
//  iNewton
//
//  Created by 谷山卓朗 on 2020/12/22.
//

import SwiftUI

struct TopView: View {
    var body: some View {
        NavigationView {
            VStack{
                Image("title2")
                    .ignoresSafeArea(edges: .top)
                Image("newton1")
                    .resizable()
                    .frame(width: 200.0, height: 200.0)
                
                NavigationLink(destination: AltitudeView()) {
                    Image("PlayButton")
                        .resizable()
                        .frame(width: 100.0, height: 60.0)
                }
                
            }
            
        }
        
        
    }
}

struct TopView_Previews: PreviewProvider {
    static var previews: some View {
        TopView()
    }
}
