//
//  PieChartView.swift
//  00857202_hw4
//
//  Created by User02 on 2020/11/19.
//

import SwiftUI

struct PieChartView: View {
    var startAngle: [Angle]
    var body: some View {
        ZStack {
            
            
            PieChart(startAngle: self.startAngle[0],
                     endAngle: self.startAngle[1])
                .foregroundColor(Color(hue: 0/255, saturation: 0.5, brightness: 0.9))
            PieChart(startAngle: self.startAngle[1],
                     endAngle: self.startAngle[2])
                .foregroundColor(Color(hue: 20/255, saturation: 0.5, brightness: 0.9))
            PieChart(startAngle: self.startAngle[2],
                     endAngle: self.startAngle[3])
                .fill(Color.yellow)
            PieChart(startAngle: self.startAngle[3],
                     endAngle: self.startAngle[4])
                .foregroundColor(Color(hue: 120/255, saturation: 1.0, brightness: 0.8))
            PieChart(startAngle: self.startAngle[4],
                     endAngle: self.startAngle[5])
                .foregroundColor(Color(hue: 140/255, saturation: 1.0, brightness: 0.8))
            PieChart(startAngle: self.startAngle[5],
                     endAngle: .degrees(360))
                .foregroundColor(Color(hue: 0.69, saturation: 0.5, brightness: 1.0))
            ZStack{
                Circle().fill(Color.white)
                    .frame(width: 100, height: 100)
                Text(":)")
            }
            
                
            
        }
    }
}

struct PieChartView_Previews: PreviewProvider {
    static var previews: some View {
        PieChartView(startAngle: [.degrees(0), .degrees(100), .degrees(100), .degrees(360), .degrees(360),.degrees(360)])
            .frame(width: 200, height: 200)
    }
}

struct PieChart: Shape {
    var startAngle: Angle
    var endAngle: Angle
    let lineWidth: CGFloat = 40
    let radius: CGFloat = 50
    
    var percentages: [CGFloat] = [30, 30, 40]
    func path(in rect: CGRect) -> Path {
        Path { (path) in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            path.move(to: center)
            path.addArc(center: center, radius: rect.midX,
                        startAngle: startAngle, endAngle: endAngle, clockwise: false)
        }
    }
}
