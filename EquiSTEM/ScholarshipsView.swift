import SwiftUI
    
    struct ScholarshipDropdownOption: Hashable {
        let key: String
        let value: String
        
        public static func == (lhs: ScholarshipDropdownOption, rhs: ScholarshipDropdownOption) -> Bool {
            return lhs.key == rhs.key
            
        }
    }
    
    struct ScholarshipDropdownRow: View {
        var option: ScholarshipDropdownOption
        var onOptionSelected: ((_ option: ScholarshipDropdownOption) -> Void)?
        
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
    
        struct ScholarshipDropdown: View {
            var options: [ScholarshipDropdownOption]
            var onOptionSelected: ((_ option: ScholarshipDropdownOption) -> Void)?
            
            var body: some View {
                ScrollView() {
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(self.options, id: \.self) { option in
                            ScholarshipDropdownRow(option: option, onOptionSelected: self.onOptionSelected)
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
    
    
    struct ScholarshipDropdownSelector: View {
        @State private var shouldShowDropdown = false
        @State private var selectedOption: ScholarshipDropdownOption? = nil
        var placeholder: String
        var options: [ScholarshipDropdownOption]
        var onOptionSelected: ((_ option: ScholarshipDropdownOption) -> Void)?
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
                        ScholarshipDropdown(options: self.options, onOptionSelected: { option in
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
    
    
    
    
    struct ScholarshipView: View {
        
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
        
        let options1: [ScholarshipDropdownOption] = [
            ScholarshipDropdownOption(key: uniqueKey, value: "American Indian / Alaska Native"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Hispanic/ Latino"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Asian"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Black / African American"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Native Hawaiian / Other Pacific Islander"),
            ScholarshipDropdownOption(key: uniqueKey, value: "White")]
        
        let options2: [ScholarshipDropdownOption] = [
            ScholarshipDropdownOption(key: uniqueKey, value: "Computer and Mathematics"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Biological, Agricultural, Environmental"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Physical Sciences"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Social Sciences"),
            ScholarshipDropdownOption(key: uniqueKey, value: "Engineers")]
        
        
        var body: some View {
               
            ZStack{
                CustomColor.UCLABlue
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Text("Scholarships")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(CustomColor.AliceBlue)
                        .padding(25)
                        .multilineTextAlignment(.center)
                        .frame(alignment:.top)
                    
                    Spacer()
                    
                    HStack {
                        
                        Group {
                            ScholarshipDropdownSelector(
                                placeholder: "Race/Ethnicity",
                                options: options1,
                                onOptionSelected: { option in
                                    print(option)
                                })
                            .padding(.horizontal)
                        }
                        
                        Group {
                            ScholarshipDropdownSelector(
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
                            Text("American Indian College Fund")
                                    .padding()
                                    .font(Font.system(size:22))
                                    .bold()
                            
    
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
                                    Link(destination: URL(string:"http://collegefund.org/student-resources/scholarships/?_ga=2.184616810.250998742.1496946185-1446365453.1496946185")!) {
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
                            .frame(height:20)
                        
                        VStack{
                            Text("Microsoft Disability Scholarship")
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
                                    Link(destination: URL(string:"http://www.microsoft.com/en-us/diversity/programs/microsoftdisabilityscholarship.aspx")!) {
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
                            .frame(height:20)
                        
                        VStack{
                            Text("NAEHCY Scholarship program")
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
                                    Link(destination: URL(string:"https://naehcy.org/naehcy-scholarship-fund/")!) {
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
                    
                    
                    
                    Image("scholarships-graphic")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:225, height:225)
                    
                    Spacer()
                    
                    
                }
            }
        }
    }
struct ScholarshipView_Preview: PreviewProvider {
    static var previews: some View {
        ScholarshipView()
    }
}

