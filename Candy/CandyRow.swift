//
//  CandyRow.swift
//  00857202_hw4
//
//  Created by User16 on 2020/11/18.
//

import SwiftUI

struct CandyRow: View {
    var candy: Candy
    var roles = ["巧克力","軟糖","棉花糖","硬糖","果凍","鹹食"]
    var body: some View {
        HStack {
            Text(candy.candys).background(Color(red: 228/255, green: 115/255, blue: 91/255 )).font(.headline).foregroundColor(Color(red: 228, green: 115, blue: 91    ))
            
                Text(roles[candy.part_of_speech])
                    .padding(.leading)
            
            Spacer()
            Image(systemName: candy.isFavor ? "star.fill" : "star")
        }.padding(.horizontal)
    }
}

struct CandyRow_Previews: PreviewProvider {
    static var previews: some View {
        CandyRow(candy:Candy(candys:"Popcorn",part_of_speech:0,meaning:"sth that can store food", sentence: "good.",isFavor:true))
    }
}
