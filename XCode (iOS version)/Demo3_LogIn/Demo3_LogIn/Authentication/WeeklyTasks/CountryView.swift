////
//  CountryView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/11/24.
//

import SwiftUI

struct Country: Identifiable {
    let id = UUID()
    let name: String
    let flag: String
}

struct CountryView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    @State private var countries = [
        Country(name: "Afghanistan", flag: "🇦🇫"),
        Country(name: "Albania", flag: "🇦🇱"),
        Country(name: "Algeria", flag: "🇩🇿"),
        Country(name: "American Samoa", flag: "🇦🇸"),
        Country(name: "Andorra", flag: "🇦🇩"),
        Country(name: "Angola", flag: "🇦🇴"),
        Country(name: "Anguilla", flag: "🇦🇮"),
        Country(name: "Antigua & Barbuda", flag: "🇦🇬"),
        Country(name: "Argentina", flag: "🇦🇷"),
        Country(name: "Armenia", flag: "🇦🇲"),
        Country(name: "Aruba", flag: "🇦🇼"),
        Country(name: "Australia", flag: "🇦🇺"),
        Country(name: "Austria", flag: "🇦🇹"),
        Country(name: "Azerbaijan", flag: "🇦🇿"),
        Country(name: "Bahamas", flag: "🇧🇸"),
        Country(name: "Bahrain", flag: "🇧🇭"),
        Country(name: "Bangladesh", flag: "🇧🇩"),
        Country(name: "Barbados", flag: "🇧🇧"),
        Country(name: "Belarus", flag: "🇧🇾"),
        Country(name: "Belgium", flag: "🇧🇪"),
        Country(name: "Belize", flag: "🇧🇿"),
        Country(name: "Benin", flag: "🇧🇯"),
        Country(name: "Bermuda", flag: "🇧🇲"),
        Country(name: "Bhutan", flag: "🇧🇹"),
        Country(name: "Bolivia", flag: "🇧🇴"),
        Country(name: "Bosnia & Herzegovina", flag: "🇧🇦"),
        Country(name: "Botswana", flag: "🇧🇼"),
        Country(name: "Brazil", flag: "🇧🇷"),
        Country(name: "British Virgin Islands", flag: "🇻🇬"),
        Country(name: "Brunei Darussalam", flag: "🇧🇳"),
        Country(name: "Bulgaria", flag: "🇧🇬"),
        Country(name: "Burkina Faso", flag: "🇧🇫"),
        Country(name: "Burundi", flag: "🇧🇮"),
        Country(name: "Cambodia", flag: "🇰🇭"),
        Country(name: "Cameroon", flag: "🇨🇲"),
        Country(name: "Canada", flag: "🇨🇦"),
        Country(name: "Cape Verde", flag: "🇨🇻"),
        Country(name: "Cayman Islands", flag: "🇰🇾"),
        Country(name: "Central African Rep.", flag: "🇨🇫"),
        Country(name: "Chad", flag: "🇹🇩"),
        Country(name: "Chile", flag: "🇨🇱"),
        Country(name: "China", flag: "🇨🇳"),
        Country(name: "Colombia", flag: "🇨🇴"),
        Country(name: "Comoros", flag: "🇰🇲"),
        Country(name: "Congo (Rep.)", flag: "🇨🇬"),
        Country(name: "Congo (Dem. Rep.)", flag: "🇨🇩"),
        Country(name: "Cook Islands", flag: "🇨🇰"),
        Country(name: "Costa Rica", flag: "🇨🇷"),
        Country(name: "Cote d'Ivoire", flag: "🇨🇮"),
        Country(name: "Croatia", flag: "🇭🇷"),
        Country(name: "Cuba", flag: "🇨🇺"),
        Country(name: "Cyprus", flag: "🇨🇾"),
        Country(name: "Czech Republic", flag: "🇨🇿"),
        Country(name: "Denmark", flag: "🇩🇰"),
        Country(name: "Diego Garcia", flag: "🇮🇴"),
        Country(name: "Djibouti", flag: "🇩🇯"),
        Country(name: "Dominica", flag: "🇩🇲"),
        Country(name: "Dominican Rep.", flag: "🇩🇴"),
        Country(name: "Ecuador", flag: "🇪🇨"),
        Country(name: "Egypt", flag: "🇪🇬"),
        Country(name: "El Salvador", flag: "🇸🇻"),
        Country(name: "Equatorial Guinea", flag: "🇬🇶"),
        Country(name: "Eritrea", flag: "🇪🇷"),
        Country(name: "Estonia", flag: "🇪🇪"),
        Country(name: "Eswatini", flag: "🇸🇿"),
        Country(name: "Ethiopia", flag: "🇪🇹"),
        Country(name: "Falkland Islands", flag: "🇫🇰"),
        Country(name: "Faroe Islands", flag: "🇫🇴"),
        Country(name: "Fiji", flag: "🇫🇯"),
        Country(name: "Finland", flag: "🇫🇮"),
        Country(name: "France", flag: "🇫🇷"),
        Country(name: "French Guiana", flag: "🇬🇫"),
        Country(name: "French Polynesia", flag: "🇵🇫"),
        Country(name: "Gabon", flag: "🇬🇦"),
        Country(name: "Gambia", flag: "🇬🇲"),
        Country(name: "Georgia", flag: "🇬🇪"),
        Country(name: "Germany", flag: "🇩🇪"),
        Country(name: "Ghana", flag: "🇬🇭"),
        Country(name: "Gibraltar", flag: "🇬🇮"),
        Country(name: "Greece", flag: "🇬🇷"),
        Country(name: "Greenland", flag: "🇬🇱"),
        Country(name: "Grenada", flag: "🇬🇩"),
        Country(name: "Guadeloupe", flag: "🇬🇵"),
        Country(name: "Guam", flag: "🇬🇺"),
        Country(name: "Guatemala", flag: "🇬🇹"),
        Country(name: "Guinea", flag: "🇬🇳"),
        Country(name: "Guinea-Bissau", flag: "🇬🇼"),
        Country(name: "Guyana", flag: "🇬🇾"),
        Country(name: "Haiti", flag: "🇭🇹"),
        Country(name: "Honduras", flag: "🇭🇳"),
        Country(name: "Hong Kong", flag: "🇭🇰"),
        Country(name: "Hungary", flag: "🇭🇺"),
        Country(name: "Iceland", flag: "🇮🇸"),
        Country(name: "India", flag: "🇮🇳"),
        Country(name: "Indonesia", flag: "🇮🇩"),
        Country(name: "Iran", flag: "🇮🇷"),
        Country(name: "Iraq", flag: "🇮🇶"),
        Country(name: "Ireland", flag: "🇮🇪"),
        Country(name: "Israel", flag: "🇮🇱"),
        Country(name: "Italy", flag: "🇮🇹"),
        Country(name: "Jamaica", flag: "🇯🇲"),
        Country(name: "Japan", flag: "🇯🇵"),
        Country(name: "Jordan", flag: "🇯🇴"),
        Country(name: "Kazakhstan", flag: "🇰🇿"),
        Country(name: "Kenya", flag: "🇰🇪"),
        Country(name: "Kiribati", flag: "🇰🇮"),
        Country(name: "North Korea", flag: "🇰🇵"),
        Country(name: "South Korea", flag: "🇰🇷"),
        Country(name: "Kosovo", flag: "🇽🇰"),
        Country(name: "Kuwait", flag: "🇰🇼"),
        Country(name: "Kyrgyzstan", flag: "🇰🇬"),
        Country(name: "Laos", flag: "🇱🇦"),
        Country(name: "Latvia", flag: "🇱🇻"),
        Country(name: "Lebanon", flag: "🇱🇧"),
        Country(name: "Lesotho", flag: "🇱🇸"),
        Country(name: "Liberia", flag: "🇱🇷"),
        Country(name: "Libya", flag: "🇱🇾"),
        Country(name: "Liechtenstein", flag: "🇱🇮"),
    ]
    
    @State private var selectedCountry: Country? = nil
    @State private var showingPopover = false
    @State private var popoverOffset: CGFloat = 0.0
    
    // Updated initializer
        init(showSignInView: Binding<Bool>) {
            self._showSignInView = showSignInView 
            
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.black
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            // Make sure that the navigation bar uses the new appearance
                if #available(iOS 15.0, *) {
                    UINavigationBar.appearance().compactAppearance = appearance
                }
        }
    
    var body: some View {
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                countryListView
                if showingPopover, let country = selectedCountry {
                    popoverView(for: country)
                }
            }
        }
    
    private var countryListView: some View {
            VStack(alignment: .leading) {
                List(countries) { country in
                    Button(action: {
                        selectedCountry = country
                        showingPopover = true
                    }) {
                        HStack {
                            Spacer().frame(width: 16)
                            Text(country.flag)
                                .font(.largeTitle)
                            Text(country.name)
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical, 5)
                        .background(Color.blue.opacity(0.2))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .listRowInsets(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 0))
                    .listRowBackground(Color.black)
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
                .background(Color.black)
                .padding(.top, -30)
                
                //.navigationTitle("Country Flags")
                .navigationBarItems(
                    trailing: NavigationLink(
                        destination: SettingsView(showSignInView: $showSignInView)) {
                            Image(systemName: "gear")
                                .imageScale(.large)
                        })
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Country Flags")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                    }
                }
            }
            .padding(.horizontal)
        }
        
        private func popoverView(for country: Country) -> some View {
            ZStack {
                Color.black.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        showingPopover = false
                    }
                
                VStack {
                    Text(country.flag)
                        .font(.system(size: 200))
                    Text(country.name)
                        .font(.title)
                        .padding(.bottom, 10)
                    
                    Button("Close") {
                        showingPopover = false
                    }
                    .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal, 20)
                .offset(y: UIScreen.main.bounds.height / 6 + popoverOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            // Track drag offset
                            popoverOffset = max(value.translation.height, 0)
                        }
                        .onEnded { value in
                            if value.translation.height > 100 {
                                // Dismiss if dragged sufficiently
                                showingPopover = false
                            }
                            popoverOffset = 0
                        }
                )
            }
        }
}

#Preview {
    NavigationStack {
        CountryView(showSignInView: .constant(true))
    }
}
