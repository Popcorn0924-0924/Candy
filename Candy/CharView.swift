import SwiftUI

struct ChartView: View {
    @ObservedObject var candysData = CandyData()
    var index:Double = 0
    var percentAmount:[Double] = [0, 0, 0, 0, 0,0]
    var countType:[Double] = [0, 0, 0, 0, 0, 0]
    var anglesAmount = [Angle]()
    var startDegree: Double = 0
    var process:Double=0
    var chart = ["分類", "candy bar"]
    @State private var selectChart: String = "分類"
    let roles = ["巧克力","軟糖","棉花糖","硬糖","果凍","鹹食"]
    init(candysData: CandyData) {
        for candy in candysData.Candys {
            index += 1;
            if candy.part_of_speech == 0 {
                countType[0] += 1;
            } else if candy.part_of_speech == 1 {
                countType[1] += 1;
            } else if candy.part_of_speech == 2 {
                countType[2] += 1;
            } else if candy.part_of_speech == 3 {
                countType[3] += 1;
            } else if candy.part_of_speech == 4 {
                countType[4] += 1;
            }
            else {
                countType[5] += 1;
            }
            if(candy.isFavor==true){
                process += 1;
            }
        }
        
        percentAmount[0] = countType[0] / index
        percentAmount[1] = countType[1] / index
        percentAmount[2] = countType[2] / index
        percentAmount[3] = countType[3] / index
        percentAmount[4] = countType[4] / index
        percentAmount[5] = countType[5] / index
        process /= index
        for percent in percentAmount {
            anglesAmount.append(.degrees(startDegree))
            startDegree += 360 * percent
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: self.$selectChart, label: Text("請選擇統計項目：")) {
                    ForEach(self.chart, id: \.self) {
                     (text) in Text(text)
                   }
               }
               .labelsHidden()
               .pickerStyle(SegmentedPickerStyle())
               .padding(20)
                if self.selectChart == "分類" {
                    
                        VStack {
                            Spacer()
                            PieChartView(startAngle: anglesAmount)
                                .frame(width: 300, height: 300)
                            Spacer()
                            ZStack{
                                
                                    Image("back2")
                                        .resizable()
                                        .frame(width: 300, height: 100, alignment: .bottom)
                                VStack{
                                    HStack(alignment: .top){
                                        Group{
                                            Color(hue: 0/255, saturation: 0.5, brightness: 0.9).frame(width: 10, height: 10)
                                                .offset(y:7)
                                            Text("巧克力 " + String(format: "%.1f", percentAmount[0] * 100) + "%")
                                            Color(hue: 20/255, saturation: 0.5, brightness: 0.9).frame(width: 10, height: 10)
                                            .offset(y:7)
                                            Text("軟糖 " + String(format: "%.1f", percentAmount[1] * 100) + "%")
                                            Color.yellow.frame(width: 10, height: 10)
                                            .offset(y:7)
                                            Text("棉花糖 " + String(format: "%.1f", percentAmount[2] * 100) + "%")}}
                                    HStack(alignment: .top){
                                        Color(hue: 120/255, saturation: 1.0, brightness: 0.8).frame(width: 10, height: 10)
                                        .offset(y:7)
                                        Text("硬糖 " + String(format: "%.1f", percentAmount[3] * 100) + "%")
                                        Color(hue: 140/255, saturation: 1.0, brightness: 0.8).frame(width: 10, height: 10)
                                                                    .offset(y:7)
                                        Text( "果凍 " + String(format: "%.1f", percentAmount[4] * 100) + "%")
                                        Color(hue: 0.69, saturation: 0.5, brightness: 1.0).frame(width: 10, height: 10)
                                        .offset(y:7)
                                        Text( "鹹食 " + String(format: "%.1f", percentAmount[5] * 100) + "%")
                                    }
                                }
                            
                        }
                        .padding()
                    }
                    
                }
                
                    else if self.selectChart == "candy bar" {
                        VStack {
                            BarChartView(typeWidths: countType)
                                .offset(y:80)
                            Spacer()
                            ZStack{
                                
                                    Image("back2")
                                        .resizable()
                                        .frame(width: 300, height: 100, alignment: .bottom)
                                VStack{
                                    HStack(alignment: .top){

                                        Group{
                                            Color(hue: 0/255, saturation: 0.5, brightness: 0.9).frame(width: 10, height: 10)
                                                .offset(y:7)
                                            Text("巧克力 " + String(format: "%.1f", percentAmount[0] * 100) + "%")
                                            Color(hue: 20/255, saturation: 0.5, brightness: 0.9).frame(width: 10, height: 10)
                                            .offset(y:7)
                                            Text("軟糖 " + String(format: "%.1f", percentAmount[1] * 100) + "%")
                                            Color.yellow.frame(width: 10, height: 10)
                                            .offset(y:7)
                                            Text("棉花糖 " + String(format: "%.1f", percentAmount[2] * 100) + "%")}}
                                    HStack(alignment: .top){
                                        Color(hue: 120/255, saturation: 1.0, brightness: 0.8).frame(width: 10, height: 10)
                                        .offset(y:7)
                                        Text("硬糖 " + String(format: "%.1f", percentAmount[3] * 100) + "%")
                                        Color(hue: 140/255, saturation: 1.0, brightness: 0.8).frame(width: 10, height: 10)
                                                                    .offset(y:7)
                                        Text( "果凍 " + String(format: "%.1f", percentAmount[4] * 100) + "%")
                                        Color(hue: 0.69, saturation: 0.5, brightness: 1.0).frame(width: 10, height: 10)
                                        .offset(y:7)
                                        Text( "鹹食 " + String(format: "%.1f", percentAmount[5] * 100) + "%")
                                    }
                                }
                            
                        }
                }
                Spacer()
                    }
            }.navigationBarTitle("分析")
            
        }
        
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(candysData: CandyData())
    }
}
