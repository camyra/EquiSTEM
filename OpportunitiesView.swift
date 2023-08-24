//
//  OpportunitiesView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/29/23.
//

import SwiftUI

struct OpportunitiesView: View {
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
    var body: some View {
        ZStack{
            CustomColor.IndigoDye
                .ignoresSafeArea()
            
            
            VStack {
                Text("Internship Opportunities")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                List {
                    Section{
                        Link(destination: URL(string: "https://careers.google.com/students/")!) {
                            Text("Google Student Opportunities")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.UCLABlue)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    
                    Section{
                        Link(destination: URL(string: "https://intern.nasa.gov/#")!) {
                            Text("NASA Internships")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.UCLABlue)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    
                    Section{
                        Link(destination: URL(string: "https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwj6tKXniun_AhVOFcAKHf5MBS8QFnoECAsQAQ&url=https%3A%2F%2Fwww.udc.edu%2Fcas%2Ffree-stem-program-for-minority-boys%2F&usg=AOvVaw3ILZEGUlg9gmqM2hMvpCyP&opi=89978449/")!) {
                            Text("VERIZON Innovative Learning")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.UCLABlue)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                }
                .scrollContentBackground(.hidden)
                
                Image("opportunities-graphic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:265, height:265)
            }
            .padding()
        }
    }
    
}

struct OpportunitiesView_Previews: PreviewProvider {
    static var previews: some View {
        OpportunitiesView()
    }
}
