import SwiftUI

struct BarChart: View{
    @State private var width: CGFloat = 0
    var Width: Double

    var body: some View{
        ZStack(alignment: .bottom) {
            
            Capsule()
            .frame(width: 30, height: 220)
                .foregroundColor(Color(white: 0.805))
            VStack(spacing: 3) {
                Text("\(Int(self.Width))")
                    .foregroundColor(.black)
                Capsule()
                    .frame(width: 30, height: width*20)
                    .animation(.linear(duration: 1))
                    .onAppear{
                        self.width = CGFloat(self.Width)
                }
            }
        }
    }
}

struct BarChart_Previews: PreviewProvider {
    static var previews: some View {
        BarChart(Width: 3)
    }
}
