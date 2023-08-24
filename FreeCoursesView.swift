//
//  FreeCoursesView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/29/23.
//

import SwiftUI

struct DropdownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
        
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    
    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}


    struct Dropdown: View {
        var options: [DropdownOption]
        var onOptionSelected: ((_ option: DropdownOption) -> Void)?
        
        var body: some View {
            ScrollView() {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.options, id: \.self) { option in
                        DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                    }
                }
            }
            .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.gray, lineWidth: 1))
        }
    }


struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var placeholder: String
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 45
    
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(selectedOption == nil ? placeholder : selectedOption!.value)
                    .font(.system(size: 14))
                    .foregroundColor(selectedOption == nil ? Color.gray: Color.black)
                
                Spacer()
                
                Image(systemName: self.shouldShowDropdown ? "arrowtriangle.up.fill" : "arrowtriangle.down.fill")
                    .resizable()
                    .frame(width: 9, height: 5)
                    .font(Font.system(size: 9, weight: .medium))
                    .foregroundColor(Color.black)
            }
        }
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(width: .infinity, height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}




struct FreeCoursesView: View {
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
    static var uniqueKey: String {
        UUID().uuidString
    }
    
    let options1: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "American Indian / Alaska Native"),
        DropdownOption(key: uniqueKey, value: "Hispanic/ Latino"),
        DropdownOption(key: uniqueKey, value: "Asian"),
        DropdownOption(key: uniqueKey, value: "Black / African American"),
        DropdownOption(key: uniqueKey, value: "Native Hawaiian / Other Pacific Islander"),
        DropdownOption(key: uniqueKey, value: "White")]
    
    let options2: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Computer and Mathematics"),
        DropdownOption(key: uniqueKey, value: "Biological, Agricultural, Environmental"),
        DropdownOption(key: uniqueKey, value: "Physical Sciences"),
        DropdownOption(key: uniqueKey, value: "Social Sciences"),
        DropdownOption(key: uniqueKey, value: "Engineers")]
    

    
    var body: some View {
        ZStack{
            CustomColor.AliceBlue
                .ignoresSafeArea()
            
            HStack {
                
                Group {
                    DropdownSelector(
                        placeholder: "Race/Ethnicity",
                        options: options1,
                        onOptionSelected: { option in
                            print(option)
                        })
                    .padding(.horizontal)
                }
                
                Group {
                    DropdownSelector(
                        placeholder: "Field/Industry",
                        options: options2,
                        onOptionSelected: { option in
                            print(option)
                        })
                    .padding(.horizontal)
                }
            }
            .zIndex(1)
            
            VStack {
                Text("Free Courses")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.UCLABlue)
                    .padding()
                    .multilineTextAlignment(.center)
                
                List {
                    Section{
                        Link(destination: URL(string: "https://pll.harvard.edu/catalog/free")!) {
                            Text("Harvard Free Courses")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.IndigoDye)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    
                    Section{
                        Link(destination: URL(string: "https://www.kodewithklossy.com")!) {
                            Text("Kode with Klossy")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.IndigoDye)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    
                    Section{
                        Link(destination: URL(string: "https://www.khanacademy.org/")!) {
                            Text("Khan Academy Courses")
                                .padding()
                        }
                    }
                    .listRowBackground(CustomColor.IndigoDye)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.AliceBlue)
                    
                }
                .scrollContentBackground(.hidden)
                Spacer()

                Image("free-courses-graphic")
                    .resizable()
                    .frame(width:265, height:265)
                    .aspectRatio(contentMode: .fit)
            }
            .padding()
        }
    }
}


struct FreeCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        FreeCoursesView()
    }
}
