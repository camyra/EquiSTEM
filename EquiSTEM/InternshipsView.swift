//
//  OpportunitiesView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/29/23.
//
import SwiftUI
    
    struct CustomColor {
        static let IndigoDye = Color("IndigoDye")
        static let UCLABlue = Color("UCLABlue")
        static let AliceBlue = Color("AliceBlue")
        static let Asparagus = Color("Asparagus")
        static let Olivine = Color("Olivine")
    }
    
    struct InternDropdownOption: Hashable {
        let key: String
        let value: String
        
        public static func == (lhs: InternDropdownOption, rhs: InternDropdownOption) -> Bool {
            return lhs.key == rhs.key
            
        }
    }
    
    struct InternDropdownRow: View {
        var option: InternDropdownOption
        var onOptionSelected: ((_ option: InternDropdownOption) -> Void)?
        
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
    
    
    struct InternDropdown: View {
        var options: [InternDropdownOption]
        var onOptionSelected: ((_ option: InternDropdownOption) -> Void)?
        
        var body: some View {
            ScrollView() {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.options, id: \.self) { option in
                        InternDropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                    }
                }
            }
            .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
            .padding(.vertical, 12)
            .background(Color.white)
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(CustomColor.UCLABlue, lineWidth: 1))
        }
    }
    
    
    struct InternDropdownSelector: View {
        @State private var shouldShowDropdown = false
        @State private var selectedOption: InternDropdownOption? = nil
        var placeholder: String
        var options: [InternDropdownOption]
        var onOptionSelected: ((_ option: InternDropdownOption) -> Void)?
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
                    .stroke(CustomColor.UCLABlue, lineWidth: 1)
            )
            .overlay(
                VStack {
                    if self.shouldShowDropdown {
                        Spacer(minLength: buttonHeight + 10)
                        InternDropdown(options: self.options, onOptionSelected: { option in
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
    
    
    
    
    struct OpportunitiesView: View {
        
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
        
        let options1: [InternDropdownOption] = [
            InternDropdownOption(key: uniqueKey, value: "American Indian / Alaska Native"),
            InternDropdownOption(key: uniqueKey, value: "Hispanic/ Latino"),
            InternDropdownOption(key: uniqueKey, value: "Asian"),
            InternDropdownOption(key: uniqueKey, value: "Black / African American"),
            InternDropdownOption(key: uniqueKey, value: "Native Hawaiian / Other Pacific Islander"),
            InternDropdownOption(key: uniqueKey, value: "White")]
        
        let options2: [InternDropdownOption] = [
            InternDropdownOption(key: uniqueKey, value: "Computer and Mathematics"),
            InternDropdownOption(key: uniqueKey, value: "Biological, Agricultural, Environmental"),
            InternDropdownOption(key: uniqueKey, value: "Physical Sciences"),
            InternDropdownOption(key: uniqueKey, value: "Social Sciences"),
            InternDropdownOption(key: uniqueKey, value: "Engineers")]
        
        
        
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
                    
                    Spacer()
                    
                    HStack {
                        
                        Group {
                            InternDropdownSelector(
                                placeholder: "Setting",
                                options: options1,
                                onOptionSelected: { option in
                                    print(option)
                                })
                            .padding(.horizontal)
                        }
                        
                        Group {
                            InternDropdownSelector(
                                placeholder: "Field/Industry",
                                options: options2,
                                onOptionSelected: { option in
                                    print(option)
                                })
                            .padding(.horizontal)
                        }
                    }
                    .zIndex(1)
                    
                    
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
