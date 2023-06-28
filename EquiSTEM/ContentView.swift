//
//  ContentView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/26/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color(red: 0.91, green: 1.0, blue: 0.72)
                .ignoresSafeArea()
            
            VStack{
                Image("Logo")
                
                Text("EquiSTEM")
                    .font(.title)
                    .foregroundColor(Color(red: 0.68, green: 0.38, blue: 0.26))
                    .fontWeight(.bold)
                
                NavigationStack {
                    HStack {
                        NavigationLink(destination:ImpactView()) {
                            Button("Impact") {
                                
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            .buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.88, green: 0.58, blue: 0.46))
                        }
                        
                        NavigationLink(destination:ResourcesView()) {
                            Button("Resources") {
                            }
                            .font(.title2)
                            .fontWeight(.bold)
                            .buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.88, green: 0.58, blue: 0.46))
                        }
                    }
                    NavigationLink(destination:FactsView()) {
                        Button("Facts") {
                            
                        }
                        .font(.title2)
                        .fontWeight(.bold)
                        .tint(Color(red: 0.88, green: 0.58, blue: 0.46))
                        .buttonStyle(.borderedProminent)
                    }
                }
                .background(Rectangle()
                    .foregroundColor(.yellow))
                        .cornerRadius(15)
                        .shadow(radius:15)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
