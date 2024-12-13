//
//  BluetoothView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/5/24.
//

import SwiftUI

struct BluetoothView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        //NavigationView {
        ZStack {
            Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)
            VStack(spacing: 0) {
                // Horizontal ScrollView for Topics
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 15) {
                        TopicCard(topic: "Introduction to Bluetooth")
                        TopicCard(topic: "Bluetooth Versions and Range")
                        TopicCard(topic: "Bluetooth Device Pairing")
                        TopicCard(topic: "Bluetooth Communication Protocols")
                        TopicCard(topic: "Bluetooth Security Features")
                        TopicCard(topic: "Bluetooth Applications")
                        TopicCard(topic: "Bluetooth Limitations")
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                // Vertical ScrollView for Discussions
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(bluetoothDiscussions, id: \.self) { discussion in
                            DiscussionCard(title: discussion.title, content: discussion.content, imageName: discussion.imageName,
                                           showImage: discussion.imageName != nil)
                        }
                    }
                    .padding()
                }
            }
        }
            //.navigationTitle("Bluetooth")
            //.navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.clear, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Bluetooth")
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
        .navigationBarTitle("Bluetooth", displayMode: .inline)
        .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)) // Translucent background
        }
    }
//}

// Sample data for Bluetooth discussions
let bluetoothDiscussions = [
    Discussion(title: "Introduction to Bluetooth", content: "Bluetooth is a wireless communication protocol that allows devices to connect and transfer data over short distances. It operates on the 2.4 GHz ISM band. Since Bluetooth operates on radio frequencies, rather than the infrared spectrum used by traditional remote controls, devices using this technology do not have to maintain a line of sight to communicate.", imageName: "Bluetooth"),
    Discussion(title: "Bluetooth Versions and Range", content: "Bluetooth has several versions, each with improvements in range, speed, and energy consumption. Versions 4.0 and later include Bluetooth Low Energy (BLE), which is designed for energy-efficient communication.\n\nIn 1994, Ericsson started working on what became a low power wireless interface for the phones and their accessories.\n\nIn 1998, Ericsson, IBM, Intel, Nokia and Toshiba formed the “Bluetooth Special Interest Group” to establish standards for short-range radio.\n\n1999 saw the Bluetooth 0.7-1.0 spec releases designating 2.4GHz and defining core protocols.\n\nIn the last half of 1999, Microsoft, Motorola, and others joined the promotional efforts, sparking global Bluetooth adoption. The alliance has reached over 1,500 members by the year 2000.\n\n2001: 1. 1 IEEE 802.15.1.", imageName: "Bluetooth versions"),
    Discussion(title: "Bluetooth Device Pairing", content: "To communicate, Bluetooth devices must first pair with each other. Pairing involves device discovery, establishing a connection, and possibly exchanging security keys."),
    Discussion(title: "Bluetooth Communication Protocols", content: "Bluetooth supports multiple protocols, including RFCOMM for serial communication, L2CAP for data packets, and A2DP for audio streaming.", imageName: "Bluetooth protocols"),
    Discussion(title: "Bluetooth Security Features", content: "At the very least, poor Bluetooth security can allow an attacker to monitor for random devices that come near an established listening post. Depending on the target's device, further attacks could lead to a large cache of information. Much of this risk can be reduced by simply leaving a cell phone, or any other Bluetooth device, in a nondiscoverable mode at all times and only placing it into discoverable mode when you actually want to sync it with a device.\n\nAdvanced Bluetooth attacks such as bluesnarfing and bluebugging can allow an attacker to gain near-complete control over your cell phone. With a successful bluesnarf attack, a hacker can copy off all of the critical data from your cell phone without you even knowing it. Bluebugging, though it requires an additional step of being paired with the hacker's device, also allows for your phone to be controlled and listened in on by an attacker."),
    Discussion(title: "Bluetooth Applications", content: "Bluetooth technology is widely used in applications such as wireless headphones, car audio systems, fitness trackers, and smart home devices."),
    Discussion(title: "Bluetooth Limitations", content: "Despite its versatility, Bluetooth has limitations in range and speed compared to other wireless technologies, and is susceptible to interference from other devices operating in the 2.4 GHz band.")
]

// Preview for the BluetoothView
#Preview {
    NavigationStack {
        BluetoothView(showSignInView: .constant(true))
    }
}
