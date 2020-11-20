//
//  AppView.swift
//  Candy
//
//  Created by User02 on 2020/11/20.
//

import SwiftUI

struct AppView: View {
    @ObservedObject var candysData = CandyData()
    var body: some View {
        ZStack{
            TabView {
                CandyList(candysData: self.candysData)
                    .tabItem{
                        Image(systemName:"list.bullet")
                        Text("糖果")
                }
                
                ChartView(candysData: self.candysData)
                    .tabItem{
                        Image(systemName:"magnifyingglass.circle.fill")
                        Text("分析")
                            .lineLimit(nil)
                }
            }
            .accentColor(.black)
        }
        
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
