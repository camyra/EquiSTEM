//
// ImpactView.swift
// EquiSTEM
//
// Created by Camila Rivera De Jesus on 6/27/23.
//
import SwiftUI
    
    
struct ImpactView: View {
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
  var body: some View {
    ZStack{
        CustomColor.UCLABlue
        .ignoresSafeArea()
        
        VStack{
            Spacer()
                .frame(height:50)
            Image("impact-graphic")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:285, height:285)
            
            Text("Impact")
                .font(.system(size: 35))
                .foregroundColor(CustomColor.AliceBlue)
                .fontWeight(.bold)
            
            Spacer ()
              .frame(height: 25.0)
              
              VStack(alignment:.center){
                  Spacer()
                      .frame(height:15.0)
                  
                  Text("Our mission is to aid students who don’t have access to education about technology, increasing the opportunities and representation of minority groups. The purpose of this app is to raise aware of this issue and to provide resources to our users. The founders of this organization are Camila Rivera de Jesús, Faith Odunsi, and Shreya Bose.")
                      .font(.headline)
                      .foregroundColor(CustomColor.AliceBlue)
                      .fontWeight(.bold)
                      .padding()
                      .padding(.horizontal)
                      .ignoresSafeArea()
                  
                  Spacer()
                      .frame(height:20)
                      .ignoresSafeArea()
              }
              .background(CustomColor.IndigoDye)
              
        }
    }
  }
}
struct ImpactView_Previews: PreviewProvider {
  static var previews: some View {
    ImpactView()
  }
}

