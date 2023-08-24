//
//  ResourcesView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/27/23.
//

import SwiftUI

struct ResourcesView: View {
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }

    
    var body: some View {
        
        NavigationStack {
            ZStack {
                CustomColor.IndigoDye
                    .ignoresSafeArea()
            VStack {
                Image("resources-graphic")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text("Resources")
                    .font(.custom("WorkSans-Bold", size:36))
                    .foregroundColor(CustomColor.AliceBlue)
                    .padding(.top,-80)
                
                Spacer()
                    .frame(height:25.0)
                
                NavigationLink(destination:ScholarshipView()) {
                    Text("Scholarships")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding(.horizontal, 33.0)
                        .padding(.vertical, 16.5)
                        .background(CustomColor.UCLABlue)
                        .foregroundColor(CustomColor.AliceBlue)
                        .cornerRadius(10)
                }
                Spacer()
                    .frame(height:25.0)
                
                NavigationLink(destination:FreeCoursesView()) {
                    Text("Free Courses")
                        .padding()
                        .padding(.horizontal,15.0)
                        .font(.title3)
                        .fontWeight(.bold)
                        .background(CustomColor.UCLABlue)
                        .foregroundColor(CustomColor.AliceBlue)
                        .cornerRadius(10)
                }
                Spacer()
                    .frame(height:25.0)
                
                NavigationLink(destination:OpportunitiesView()) {
                    Text("Internship Opportunities")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .background(CustomColor.UCLABlue)
                        .foregroundColor(CustomColor.AliceBlue)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
        }
    }
}

struct ResourcesView_Previews: PreviewProvider {
    static var previews: some View {
        ResourcesView()
    }
}
