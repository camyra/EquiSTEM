//
//  FactsView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/27/23.
//

import SwiftUI

struct FactsView: View {
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
    
    @State private var factArray = ["", "“During the 2015-2016 school year, low-income students and students of color were less likely to have opportunities to take advanced math and science classes. A study from the U.S. Department of Education showed that only 55 percent of high schools with high Black and Latino enrollment — compared to 65 percent of all high schools — offered advanced mathematics” (Winston, 2019)", "Black and Hispanic adults are underrepresented among STEM college graduates compared with their share in the population, and a smaller share are earning degrees in a STEM field than in other degree programs. Black students earned 7% of STEM bachelor’s degrees as of 2018, the most recent year available, below their share of all bachelor’s degrees (10%) or their share of the adult population (12%). The share of Hispanic college graduates with a STEM degree –12%– remains lower than that for all college graduates (15%) in 2018. (Fry, Kennedy, Funk; 2021)", "bar-graph"]
    
    @State var randomNum = 0
    
    var body: some View {
        ZStack{
            CustomColor.AliceBlue
            .ignoresSafeArea()
            

            VStack{
                Image("facts-graphic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:275, height:275)
                
                
                Text("Information")
                    .font(.system(size:38))
                    .foregroundColor(CustomColor.IndigoDye)
                    .fontWeight(.bold)
                    .padding(.top,-50)
                                     
                Spacer ()
                    .frame(height: 20.0)
                
                Button("Fact Generator") {
                    randomNum = Int.random(in:1..<4)
                }
                .padding()
                .font(.headline)
                .foregroundColor(CustomColor.AliceBlue)
                .tint(CustomColor.UCLABlue)
                .buttonStyle(.borderedProminent)
                
                if (factArray[randomNum] == "bar-graph") {
                    Image("bar-graph")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                }else{
                    Text(factArray[randomNum])
                        .font(.subheadline)
                        .foregroundColor(CustomColor.UCLABlue)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                        .padding()
                        .border(CustomColor.IndigoDye)
                }
                Spacer()
            }
        }
    }
}

struct FactsView_Previews: PreviewProvider {
    static var previews: some View {
        FactsView()
    }
}
