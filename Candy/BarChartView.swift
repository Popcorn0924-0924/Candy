//
//  BarChartView.swift
//  Candy
//
//  Created by User02 on 2020/11/20.
//

import SwiftUI

struct BarChartView: View {
    var typeWidths: [Double]

    var body: some View {
        HStack {
            BarChart(Width: typeWidths[0])
                .foregroundColor(Color(hue: 0/255, saturation: 0.5, brightness: 0.9))
            BarChart(Width: typeWidths[1])
                .foregroundColor(Color(hue: 20/255, saturation: 0.5, brightness: 0.9))
            BarChart(Width: typeWidths[2])
                .foregroundColor(.yellow)
            BarChart(Width: typeWidths[3])
                .foregroundColor(Color(hue: 120/255, saturation: 1.0, brightness: 0.8))
            BarChart(Width: typeWidths[4])
                .foregroundColor(Color(hue: 140/255, saturation: 1.0, brightness: 0.8))
            BarChart(Width: typeWidths[5])
                .foregroundColor(Color(hue: 0.69, saturation: 0.5, brightness: 1.0))
            
        }//.frame(width: 400, height: 500)
    }
}

struct BarChartView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartView(typeWidths: [2, 10, 10, 10, 10, 10])
    }
}
