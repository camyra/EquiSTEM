//
//  FreeCoursesView.swift
//  EquiSTEM
//
//  Created by Camila Rivera De Jesus on 6/29/23.
//
import SwiftUI
struct FCDropdownOption: Hashable {
    let key: String
    let value: String
    
    public static func == (lhs: FCDropdownOption, rhs: FCDropdownOption) -> Bool {
        return lhs.key == rhs.key
        
    }
}
struct FCDropdownRow: View {
    var option: FCDropdownOption
    var onOptionSelected: ((_ option: FCDropdownOption) -> Void)?
    
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
    struct FCDropdown: View {
        var options: [FCDropdownOption]
        var onOptionSelected: ((_ option: FCDropdownOption) -> Void)?
        
        var body: some View {
            ScrollView() {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(self.options, id: \.self) { option in
                        FCDropdownRow(option: option, onOptionSelected: self.onOptionSelected)
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
struct FCDropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: FCDropdownOption? = nil
    var placeholder: String
    var options: [FCDropdownOption]
    var onOptionSelected: ((_ option: FCDropdownOption) -> Void)?
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
                    FCDropdown(options: self.options, onOptionSelected: { option in
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
    
    let options1: [FCDropdownOption] = [
        FCDropdownOption(key: uniqueKey, value: "In person"),
        FCDropdownOption(key: uniqueKey, value: "Online"),
        FCDropdownOption(key: uniqueKey, value: "Hybrid"),
        FCDropdownOption(key: uniqueKey, value: "Asynchronous"),
        FCDropdownOption(key: uniqueKey, value: "Synchronous")]
    
    let options2: [FCDropdownOption] = [
        FCDropdownOption(key: uniqueKey, value: "Computer and Mathematics"),
        FCDropdownOption(key: uniqueKey, value: "Biological, Agricultural, Environmental"),
        FCDropdownOption(key: uniqueKey, value: "Physical Sciences"),
        FCDropdownOption(key: uniqueKey, value: "Social Sciences"),
        FCDropdownOption(key: uniqueKey, value: "Engineers")]
    
    
    var body: some View {
        ZStack{
            CustomColor.AliceBlue
                .ignoresSafeArea()
        
            
            VStack {
                Text("Free Courses")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.UCLABlue)
                    .padding()
                    .multilineTextAlignment(.center)
                
                HStack {
                    
                    Group {
                            FCDropdownSelector(
                                placeholder: "Setting",
                                options: options1,
                                onOptionSelected: { option in
                                    print(option)
                                })
                            .padding(.horizontal)
                    }
                    
                    Group {
                        FCDropdownSelector(
                            placeholder: "Field/Industry",
                            options: options2,
                            onOptionSelected: { option in
                                print(option)
                            })
                        .padding(.horizontal)
                    }
                }
                .zIndex(1)
                
                Spacer()
                    .frame(height:35)
            
                ScrollView {
                    VStack{
                        Text("Harvard Courses")
                            .padding()
                        HStack{
                            VStack{
                                Text("Eligibility:")
                                Spacer()
                                Text("Description:")
                                Spacer()
                                Text("Amount:")
                            }
                            .padding()
                            
                            Spacer()
                            
                            VStack{
                                Link(destination: URL(string:"https://pll.harvard.edu/catalog/free")!) {
                                    Text("Apply!")
                                        .font(.title3)
                                        .fontWeight(.bold)
                                        .padding(.horizontal, 33.0)
                                        .padding(.vertical, 16.5)
                                        .background(CustomColor.UCLABlue)
                                        .foregroundColor(CustomColor.AliceBlue)
                                        .cornerRadius(10)
                                }
                            }
                            .padding()
                        }
                        
                        Spacer()
                            .frame(height:25)
                    }
                    .background(CustomColor.IndigoDye)
                    .foregroundColor(CustomColor.AliceBlue)
                    .fontWeight(.bold)
                    
                    Spacer()
                    
                VStack{
                    Text("Kode With Klossy")
                        .padding()
                    HStack{
                        VStack{
                            Text("Eligibility:")
                            Spacer()
                            Text("Description:")
                            Spacer()
                            Text("Amount:")
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack{
                            Link(destination: URL(string:"https://www.kodewithklossy.com")!) {
                                Text("Apply!")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 33.0)
                                    .padding(.vertical, 16.5)
                                    .background(CustomColor.UCLABlue)
                                    .foregroundColor(CustomColor.AliceBlue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height:25)
                }
                .background(CustomColor.IndigoDye)
                .foregroundColor(CustomColor.AliceBlue)
                .fontWeight(.bold)
                    
                    Spacer()
                    
                VStack{
                    Text("Khan Academy Courses")
                        .padding()
                    HStack{
                        VStack{
                            Text("Eligibility:")
                            Spacer()
                            Text("Description:")
                            Spacer()
                            Text("Amount:")
                        }
                        .padding()
                        
                        Spacer()
                        
                        VStack{
                            Link(destination: URL(string:"https://www.khanacademy.org/")!) {
                                Text("Apply!")
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .padding(.horizontal, 33.0)
                                    .padding(.vertical, 16.5)
                                    .background(CustomColor.UCLABlue)
                                    .foregroundColor(CustomColor.AliceBlue)
                                    .cornerRadius(10)
                            }
                        }
                        .padding()
                    }
                    
                    Spacer()
                        .frame(height:25)
                }
                .background(CustomColor.IndigoDye)
                .foregroundColor(CustomColor.AliceBlue)
                .fontWeight(.bold)
                    
            }
                .padding(.horizontal)
                
                Spacer()
                Image("free-courses-graphic")
                    .resizable()
                    .frame(width:265, height:265)
                    .aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct FreeCoursesView_Previews: PreviewProvider {
    static var previews: some View {
        FreeCoursesView()
    }
}

