//
//  SignedInView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 9/23/24.
//

import SwiftUI

struct SignedInView: View {
    @Binding var showSignInView: Bool
    @State private var showChecklist = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("demo3_bg3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer(minLength: 90)
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Weekly Tasks in Mobile Computing")
                        .foregroundColor(.white)
                    Spacer(minLength: 15)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            NavigationLink(destination: CalculatorView()) {
                                ItemView(title: "Calculator", subtitle: "Week 4")
                            }
                            NavigationLink(destination: InfraredView(showSignInView: $showSignInView)) {
                                ItemView(title: "Infrared Communication", subtitle: "Week 5")
                            }
                            NavigationLink(destination: BluetoothView(showSignInView: $showSignInView)) {
                                ItemView(title: "Bluetooth ", subtitle: "Week 6")
                            }
                            NavigationLink(destination: WirelessView(showSignInView: $showSignInView)) {
                                ItemView(title: "Wireless Transfer", subtitle: "Week 7")
                            }
                            NavigationLink(destination: CountryView(showSignInView: $showSignInView)) {
                                ItemView(title: "Country Flags", subtitle: "Week 8")
                            }
                            NavigationLink(destination: RealTimeView(showSignInView: $showSignInView)) {
                                ItemView(title: "Real-Time Mobile Computing Services", subtitle: "Week 10")
                            }
                        }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    
                    Button(action: {
                        showChecklist.toggle()
                    }) {
                    Text("Checklist")
                    .foregroundColor(.blue)
                    .fontWeight(.bold)
                }
                .padding(.top, 0)
//                .popover(isPresented: $showChecklist) {
//                                        ChecklistView(showChecklist: $showChecklist)
//                                            .frame(width: 400, height: 800) // Adjust size as needed
//                                    }
                
                    Spacer()
                    
                    //.navigationTitle("Home")
                    .navigationBarItems(trailing: NavigationLink(destination: SettingsView(showSignInView: $showSignInView)) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                        })
                    .padding(.top,10)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Home")
                            .foregroundColor(.white)
                            .font(.system(size: 24, weight: .bold))
                        }
                    }
                }
            }
            .sheet(isPresented: $showChecklist) {
                            ChecklistView(showChecklist: $showChecklist) // The checklist view that will appear as a popup
            }
        }
    }
}

struct ItemView: View {
    var title: String
    var subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .center)
            Text(subtitle)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .center)
        }
        .frame(width: 200, height: 100)
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )
        .cornerRadius(15)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct ChecklistView: View {
    @Binding var showChecklist: Bool
    @State private var tasks = [
        TaskItem(name: "Week 1: Display Hello World", isChecked: true),
        TaskItem(name: "Week 2: Get User Information", isChecked: true),
        TaskItem(name: "Week 3: Login Activity", isChecked: true),
        TaskItem(name: "Week 4: Calculator App", isChecked: true),
        TaskItem(name: "Week 5: Infrared Communication", isChecked: true),
        TaskItem(name: "Week 6: Bluetooth", isChecked: true),
        TaskItem(name: "Week 7: Wireless Transfer", isChecked: true),
        TaskItem(name: "Week 8: Listview of Countries", isChecked: true),
        TaskItem(name: "Week 9: Application of Firebase", isChecked: true),
        TaskItem(name: "Week 10: Real-Time Mobile Computing Services ", isChecked: true),
        TaskItem(name: "Project Proposal ", isChecked: true),
    ]
    
    var body: some View {
        VStack {
            Text("Checklist")
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 10)
            List {
                ForEach($tasks) { $task in
                    HStack {
                        Text(task.name)
                        Spacer()
                        Image(systemName: task.isChecked ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(task.isChecked ? .blue : .gray)
                            .onTapGesture {
                                task.isChecked.toggle()
                            }
                    }
                }
            }
            Button("Close") {
                showChecklist = false
            }
            .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal, 20)
    }
}
struct TaskItem: Identifiable {
    var id = UUID()
    var name: String
    var isChecked: Bool
}

#Preview {
    SignedInView(showSignInView: .constant(false))
}

