//
//  InfraredView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/5/24.
//

import SwiftUI

struct InfraredView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        //NavigationView {
            ZStack {
                            // Background image or color
                Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    // Horizontal ScrollView for Topics
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            TopicCard(topic: "Introduction")
                            TopicCard(topic: "IR Spectrum of Operation")
                            TopicCard(topic: "Infrared Devices - LED and Laser")
                            TopicCard(topic: "How Infrared Communication Network Works")
                            TopicCard(topic: "Infrared-IR Advantages")
                            TopicCard(topic: "Infrared-IR Disadvantages")
                            TopicCard(topic: "Infrared Communication Applications")
                        }
                        .padding(.horizontal)
                    }
                    .padding(.vertical, 10)
                        
                    // Vertical ScrollView for Discussions
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(discussions, id: \.self) { discussion in
                                DiscussionCard(title: discussion.title, content: discussion.content, imageName: discussion.imageName,
                                               showImage: discussion.imageName != nil)
                            }
                        }
                        .padding()
                    }
                }
            }
                //}
//                .navigationTitle("Infrared Communication")
//                .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.clear, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Infrared Communication")
                        .foregroundColor(.black)
                        .font(.system(size: 24, weight: .bold))
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SettingsView(showSignInView: $showSignInView)) {
                        Image(systemName: "gear")
                            .imageScale(.large)
                    }
                }
            }
//                        .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)) // Translucent background
//                    }
//                }
        
            .navigationBarTitle("Infrared Communication", displayMode: .inline)
            .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all))
        
        }
        //.navigationViewStyle(StackNavigationViewStyle())
    }
//}

// Sample discussions data model
struct Discussion: Hashable {
    var title: String
    var content: String
    var imageName: String?
}

// Sample data for discussions
let discussions = [
    Discussion(title: "Introduction", content: "As we know infrared (IR) devices are used in wireless personal area networks spanning coverage range of about 30 feet which involves laptops, computers, PDAs and cellular phones. It has frequency range between 300 GHz and 400 THz and wavelength range between 1 mm and 750 nm.\n\n As we know Infra means below and red refers to red color light. Hence the name Infrared stands for light which has low frequency or long wavelength than red light spectrum.", imageName: "IR"),
    Discussion(title: "IR Spectrum of Operation", content: "Figure-1 depicts light signal spectrum which mentions infrared (IR) spectrum also. As shown IR spectrum falls between 300 GHz to 400 THz frequency region. Infrared spectrum is further divided into near infrared, mid-infrared and far-infrared bands.", imageName: "IR Spectrum"),
    Discussion(title: "Infrared Devices - LED and Laser", content: "There are two infrared components used in IR devices viz. LED (light Emitting Diode) and Laser Diode. LED has wider transmission beam and suitable for diffuse mode of configuration as described below. It is most commonly used. It is used as transmitting element in Infrared communication.\n\nThe other component is Laser Diode which has more focused beam. Moreover it is more efficient optical element used in receiving part of Infrared communication system.\n\nMany infrared devices such as remote control, PDAs and Laptops follow rules defined by IrDA. IrDA stands for Infrared Data Association.", imageName: nil),
    Discussion(title: "How Infrared Communication Network Works", content: "Fig-1:Infrared Communication Network\nThere are two configuration modes in infrared viz. point to point communication and diffuse communication.\n\nIn point to point communication, both transmitter and receiver infrared devices should be placed in line of sight of each other and there should not be any obstacles (e.g. walls) in between them.\n\nIn diffuse communication, transmitter and receiver IR devices should be kept close to each other but they need not be in the straight line of sight. Most commercial IR products will operate efficiently within 15 degree of each other.\n\nInfrared detector operates at 38.5 KHz frequency of operation.", imageName: "IR Network"),
    Discussion(title: "Infrared-IR Advantages", content: "Following are the advantages of Infrared:\n\nIt is secure way of communication as communication is point to point or line of sight. It is not feasible for intruder to come in between and hack the data.\n\nIR devices have low power consumption and hence battey will last for longer period.\n\nIR devices are less costly.", imageName: nil),
    Discussion(title: "Infrared-IR Disadvantages", content: "Following are the disadvantages of Infrared:\n\nAs it is line of sight, it is difficult to control things not in line of sight of transmitting IR control device.\n\nIt can control one device at a time.\n\n Maximum data transfer rate is about 4 Mbps\n\nThe device should be kept stable during the data transfer mode.\n\nhard obstacles (such as doors, walls), bright sunlight, smoke, dust and fog affects Infrared communication.\n\nEven though we can not see Infrared waves, it can damage eyes if transmitted with more signal power.", imageName: nil),
    Discussion(title: "Infrared Communication Applications", content: "Infrared has a variety of uses and applications. Some common uses for IR include heat sensors, thermal imaging and night vision equipment.\n\nIn networking, wired and wireless operations use infrared light. Remote controls use near-infrared light, transmitted with LEDs, to send focused signals to home-entertainment devices, such as televisions. Fiber optic cables also use infrared light to transmit data.", imageName: "visible spectrum")
]

// Topic card for the horizontal scroll view
struct TopicCard: View {
    var topic: String

    var body: some View {
        Text(topic)
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue.opacity(0.7))
            .cornerRadius(10)
            .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

// Discussion card for the vertical scroll view
struct DiscussionCard: View {
    var title: String
    var content: String
    var imageName: String?
    var showImage: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.blue)
            
            if let imageName = imageName, showImage {
                Image(imageName) // Use the passed image name
                    .resizable()
                    .scaledToFit()
                    .frame(width: 320) // Adjust the size of the image
                    .cornerRadius(10)
                    .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
                    .frame(maxWidth: .infinity, alignment: .center)
            }

            Text(content)
                .font(.body)
                .foregroundColor(.primary)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
        .background(Color.white.opacity(0.9)) 
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 2)
    }
}

#Preview {
    NavigationStack {
        InfraredView(showSignInView: .constant(true))
    }
}
