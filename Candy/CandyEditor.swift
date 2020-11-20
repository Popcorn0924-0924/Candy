//
//  CandyEditor.swift
//  00857202_hw4
//
//  Created by User16 on 2020/11/18.
//

import SwiftUI

struct CandyEditor: View {
    @Environment(\.presentationMode) var presentationMode
    var candysData: CandyData
    @State private var candyColor: Color = Color(red: 225/255, green: 200/255, blue:180/255)
    @State private var candys = ""
    @State private var part_of_speech = 0
    @State private var meaning = ""
    @State private var sentence = ""
    @State private var isFavor = false
    @State private var opacity: Double = 0
    @State private var showAlert = false
    var editCandy: Candy?
    var roles = ["巧克力","軟糖","棉花糖","硬糖","果凍","鹹食"]
    var body: some View {
        VStack{
            Image("candy")
    
                .opacity(opacity)
                .animation(
                             Animation.linear(duration: 2)
                               .repeatCount(1, autoreverses: false)
                          )
                          .onAppear {
                            opacity = 1
                        }
            
            Form {
                ScrollView {
                TextField("Candy", text: $candys)
                    .padding(10)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(candyColor, lineWidth: 5))

                    .frame(height: 55)
//                    UIApplication.shared.endEditing()
                 Picker(selection: $part_of_speech, label: Text("種類")) {
                        ForEach(0..<roles.count,id:\.self){(index) in
                            Text(self.roles[index]).tag(index)
                            }
                        }
                    .pickerStyle(WheelPickerStyle())
                    .frame(height: 50)
                    .position(x: 120, y: 10)
                    .clipped()
                 
                
                
                MultilineTextField("心得",text:$sentence)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(candyColor, lineWidth: 5))
                Toggle("加入最愛", isOn: $isFavor)
                }
            }
            
            .navigationBarTitle("Add new Candy")
            
            .navigationBarItems(trailing: Button("Save") {
                if(self.candys == "" ||  (self.sentence=="")) {
                    self.showAlert = true
                }
                else{
                    let candy = Candy(candys: self.candys,  part_of_speech: self.part_of_speech, meaning: self.meaning, sentence: self.sentence, isFavor:self.isFavor)
                    
                    if let editCandy = self.editCandy {
                        let index = self.candysData.Candys.firstIndex {
                            $0.id == editCandy.id
                            }!
                        self.candysData.Candys[index] = candy
                    } else {
                        self.candysData.Candys.insert(candy, at: 0)
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }
            } .alert(isPresented: $showAlert) {
                       () -> Alert in
                return Alert(title: Text("儲存失敗"), message: Text("給我填心得喔？"))})
                .onAppear {
                    if let editCandy = self.editCandy {
                        self.candys = editCandy.candys
                        self.part_of_speech=editCandy.part_of_speech
                        self.sentence = editCandy.sentence
                        self.isFavor = editCandy.isFavor
                    }
                
                }.frame(width: 280, height: 350, alignment: .top).background(Color.white)

        }
        
    }
}

struct CandyEditor_Previews: PreviewProvider {
    static var previews: some View {
        CandyEditor(candysData: CandyData())
    }
}
struct FormTextViewModifier: ViewModifier {
    let candyColor:Color
    func body(content: Content) -> some View {
        content
            .foregroundColor(candyColor)
            .padding(15)
            .background(candyColor.colorInvert())
            .cornerRadius(25)
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(candyColor, lineWidth: 5))
    }
}
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
