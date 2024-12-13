//
//  WirelessTransferView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/5/24.
//

import SwiftUI

struct WirelessView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                // Horizontal ScrollView for Topics
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        TopicCard(topic: "Introduction to Wireless Transfer")
                        TopicCard(topic: "Wi-Fi Technology")
                        TopicCard(topic: "Bluetooth Transfer")
                        TopicCard(topic: "NFC (Near Field Communication)")
                        TopicCard(topic: "Infrared Transfer")
                        TopicCard(topic: "Cellular Data Networks")
                        TopicCard(topic: "Security in Wireless Transfer")
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                // Vertical ScrollView for Discussions
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(wirelessDiscussions, id: \.self) { discussion in
                            DiscussionCard(title: discussion.title, content: discussion.content, imageName: discussion.imageName,
                                           showImage: discussion.imageName != nil)
                        }
                    }
                    .padding()
                }
            }
        }
            //.navigationTitle("Wireless Transfer")
            //.navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(Color.clear, for: .navigationBar)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Wireless Transfer")
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
            .navigationBarTitle("Wireless Transfer", displayMode: .inline)
            .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)) // Translucent background
        }
    }
//}

// Sample data for Wireless Transfer discussions
let wirelessDiscussions = [
    Discussion(title: "Introduction to Wireless Transfer", content: "Wireless transfer enables data exchange between devices without physical connections, using technologies like Wi-Fi, Bluetooth, and infrared.\n\n Wireless power transfer works by using electromagnetic fields to transfer electrical energy from a power source to an electrical device without the need for physical connectors or wires. There are a few different methods for wireless power transfer, but one of the most common approaches is inductive coupling.", imageName: "Wireless"),
    Discussion(title: "Wi-Fi Technology", content: "Wi-Fi is a high-speed wireless transfer technology, commonly used for internet connectivity and data sharing within a local area network (LAN). It allows devices such as computers (laptops and desktops), mobile devices (smart phones and wearables), and other equipment (printers and video cameras) to interface with the Internet to exchange information with one another, creating a network.\n\n Internet connectivity occurs through a wireless router. When you access Wi-Fi, you are connecting to a wireless router that allows your Wi-Fi-compatible devices to interface with the Internet."),
    Discussion(title: "Bluetooth Transfer", content: "Bluetooth facilitates short-range data transfer, often used for pairing devices like headphones, speakers, and file sharing between devices."),
    Discussion(title: "NFC (Near Field Communication)", content: "NFC allows close-proximity communication, typically within a few centimeters, enabling contactless payments and quick data exchange between devices.", imageName: "Wireless NFC"),
    Discussion(title: "Infrared Transfer", content: "Infrared uses light waves to transfer data over short distances. It requires line-of-sight and is common in TV remotes and some older wireless devices."),
    Discussion(title: "Cellular Data Networks", content: "Cellular networks enable data transfer over long distances via mobile network providers, commonly used in smartphones for internet and data services.\n\n When joined together, these cells provide radio coverage over a wide geographic area. This enables numerous portable transceivers (e.g., mobile phones, tablets and laptops equipped with mobile broadband modems, pagers, etc.) to communicate with each other and with fixed transceivers and telephones anywhere in the network, via base stations, even if some of the transceivers are moving through more than one cell during transmission."),
    Discussion(title: "Security in Wireless Transfer", content: "Wireless transfers must consider data security to prevent Encrypting your wireless data prevents anyone who might be able to access your network from viewing it. There are several encryption protocols available to provide this protection. Wi-Fi Protected Access (WPA), WPA2, and WPA3 encrypt information being transmitted between wireless routers and wireless devices. WPA3 is currently the strongest encryption. WPA and WPA2 are still available; however, it is advisable to use equipment that specifically supports WPA3, as using the other protocols could leave your network open to exploitation.  ")
]

// Preview for the WirelessTransferView
#Preview {
    NavigationStack {
        WirelessView(showSignInView: .constant(true))
    }
}
