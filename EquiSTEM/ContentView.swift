//
// ContentView.swift
// EquiSTEM
//
// Created by Camila Rivera De Jesus on 6/26/23.
//
import SwiftUI

/*palette
let LapisLazuli = {Color(red:5, green:102, blue:141)}
let UCLABlue = (Color(red:66, green:122, blue:161))
let AliceBlue = (Color(red:235, green:242, blue:250))
let Asparagus = (Color(red:103, green:148, blue:54))
let Olivine = (Color(red:142, green:174, blue:90))*/

struct ContentView: View {
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
  var body: some View {
      NavigationStack {
        ZStack{
            CustomColor.UCLABlue
            .ignoresSafeArea()
            
            
            
          VStack{
            Image("EquiSTEM")
                  .resizable()
                  .aspectRatio(contentMode: .fit)
                  .frame(width:265, height:265)
                  .padding()
              
              Spacer()
                  .frame(height:40)
            HStack {
              NavigationLink(destination:ImpactView()) {
                Text("Impact")
                  .font(.title2)
                  .fontWeight(.bold)
                  .padding(.horizontal, 33.0)
                  .padding(.vertical, 37.0)
                  .background(CustomColor.IndigoDye)
                  .foregroundColor(CustomColor.AliceBlue)
                  .cornerRadius(15)
              }
              Spacer()
                .frame(width: 20.0)
              NavigationLink(destination:ResourcesView()) {
                Text("Resources")
                  .padding()
                  .padding(.vertical, 22.5)
                  .font(.title2)
                  .fontWeight(.bold)
                  .background(CustomColor.IndigoDye)
                  .foregroundColor(CustomColor.AliceBlue)
                  .cornerRadius(15)
              }
            }
            Spacer()
              .frame(height: 20)
            NavigationLink(destination:FactsView()) {
              Text("Facts")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal, 40.0)
                .padding(.vertical, 34.0)
                .background(CustomColor.IndigoDye)
                .foregroundColor(CustomColor.AliceBlue)
                .cornerRadius(15)
              }
            }
          }
        }
      }
    }
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

