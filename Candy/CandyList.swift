//
//  CandyList.swift
//  00857202_hw4
//
//  Created by User16 on 2020/11/18.
//

import SwiftUI

struct CandyList: View {
    @ObservedObject var candysData = CandyData()
    @State private var showEditCandy = false
    @State private var searchText = ""
    var filterCandys: [Candy] {
           return candysData.Candys.filter({ searchText.isEmpty ? true : $0.candys.contains(searchText) })
       }
    var body: some View {
        
        NavigationView {
            VStack{
//
                Spacer()
                List{
                    SearchBar(text: $searchText)
                ForEach(filterCandys) { (candy) in
                    NavigationLink(destination: CandyEditor(candysData: self.candysData, editCandy: candy)) {
                        CandyRow(candy:candy)
                    }
                }
                    .onDelete { (indexSet) in
                        self.candysData.Candys.remove(atOffsets: indexSet)
                    }
                    .onMove { (indexSet, index) in
                        self.candysData.Candys.move(fromOffsets: indexSet,
                                                  toOffset: index)
                    }
                }
                    
                .navigationBarTitle("Candy")
                .background(Image("back"))
                
                .navigationBarItems(leading: EditButton() , trailing: Button(action: {
                    self.showEditCandy = true
                }) {
                    Image(systemName: "plus.circle.fill")
                })
                    .sheet(isPresented: $showEditCandy) {
                        NavigationView {
                            CandyEditor(candysData: self.candysData)
                        }
                }
//                Image("")
//                    .resizable()
//                    .frame(width: 200, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            }
            
            }
                
    }
}

struct CandyList_Previews: PreviewProvider {
    static var previews: some View {
        CandyList()
    }
}
