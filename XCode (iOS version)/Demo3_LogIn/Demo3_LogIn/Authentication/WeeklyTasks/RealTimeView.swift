//
//  RealTimeView.swift
//  Demo3_LogIn
//
//  Created by Danielle Ziac Rivano Abril on 11/26/24.
//

import SwiftUI

struct RealTimeView: View {
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
                        TopicCard(topic: "What is Mobile Computing?")
                        TopicCard(topic: "Real-Time Online Interactive Applications")
                        TopicCard(topic: "ROIA Development with RTF")
                        TopicCard(topic: "Utilizing Cloud Resources for Mobile ROIA")
                        TopicCard(topic: "Mobile ROIA Challenges")
                        TopicCard(topic: "The Future of Mobile Computing")
                        TopicCard(topic: "Emerging Mobile Technologies")
                    }
                    .padding(.horizontal)
                }
                .padding(.vertical, 10)
                
                // Vertical ScrollView for Discussions
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(realTimeDiscussions, id: \.self) { discussion in
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
                Text("Mobile Computing")
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
        .navigationBarTitle("Mobile Computing", displayMode: .inline)
        .background(Color.blue.opacity(0.1).edgesIgnoringSafeArea(.all)) // Translucent background
        }
    }
//}

// Sample data for Bluetooth discussions
let realTimeDiscussions = [
    Discussion(title: "What is Mobile Computing?", content: "Mobile computing is the set of IT technologies, products, services, and operational strategies that allows you to access computation, information, and associated resources and capabilities while on the move. It allows users to access information and computational resources anytime and anywhere without being restricted to a specific location.\n\nMobile computing typically involves a mobile device, such as a laptop, tablet, or smartphone, and a wireless network connection, such as Wi-Fi or cellular technology. These devices can store data locally and do not always require a network connection to access that data. Mobile devices can connect to shared network resources, including mobile cloud-based resources. They are powered by rechargeable batteries, can run on AC power sources, and are designed for convenience and portability.\n\nOne specific example of how mobile computing helps is in the field of healthcare. Mobile devices enable healthcare professionals to access electronic medical records, consult with specialists remotely, and monitor patients in real time. This allows for better coordination of care, faster decision-making, and improved patient outcomes.", imageName: "mobile computing"),
    Discussion(title: "Real-Time Online Interactive Applications (ROIA)", content: "This paper is motivated by the challenges of the emerging class of Real-Time Online Interactive Applications (ROIA). Popular and market-relevant representatives of this application class are massively multi-player online games, as well as real-time e-learning and training applications based on high- performance simulation. ROIA are characterized by high per- formance requirements, such as: short response times to user inputs (about 0.1-1.5 s); frequent state updates (up to 100 Hz); large and frequently changing numbers of users in a single application instance (up to 104 simultaneously).\n\nWith the rapid advancement of both wireless network technologies and mobile devices, there is an increasing demand for mobile ROIA in which users access the application from their mobile devices. New application domains can be realized with mobile ROIA by exploiting user mobility and feature-rich mobile devices.\n\nA major problem for mobile ROIA is the limited com- puting power of mobile devices. ROIA processing involves computation-intensive tasks, such as 3D display rendering up to 100 times per second, which cannot be implemented with sufficient speed on mobile devices.\n\nIn this paper, we target these challenges and propose a novel architecture for offloading computation-intensive graph- ics processing tasks from mobile devices to Cloud resources. Our contribution towards implementing this architecture is a runtime system for mobile ROIA that allows users to access applications from their mobile devices and offloads at least half of the computational overhead required for display rendering to Cloud resources. The main benefit of our approach is the reduced bandwidth consumption due to transmitting small-size 3D instructions as compared to existing solutions that transmit large-size display images [2, 3, 5, 7, 8]."),
    Discussion(title: "ROIA Development with RTF", content: "Typically, there are three different kinds of actors involved in the development and execution of (mobile) ROIA:\n\n• Application developers implement the ROIA appli- cation, i.e., server and client programs realizing the application logic, and suitable mechanisms for appli- cation state distribution and monitoring,\n\n• Application providers make ROIA accessible for users by executing application servers on hardware resources, and implement dynamic load balancing for ROIA sessions according to the current user workload,\n\n• Users connect their personal computers or mobile devices (clients) to application servers using the ap- plication clients and control their avatars that interact with application entities, i.e., other users’ avatars or computer-controlled characters, in the virtual environ- ment. All users access a common application state and interact with each other concurrently within one virtual environment.", imageName: "ROIA development"),
    Discussion(title: "Utilizing Cloud Resources for Mobile ROIA", content: "While RTF provides a development and execution platform for ROIA, this section presents a novel system architecture and runtime system that allow RTF-based ROIA to be executed on mobile devices.\n\nIn mobile ROIA, the application software is expected to run on mobile devices (Fig. 1) which are highly desirable for ROIA in order to improve the mobility and interactivity between users in virtual worlds and augmented reality. How- ever, the comparatively low CPU and memory capacity, as well as limited battery life of mobile devices, combined with using potentially non-reliable, high-latency wireless networks for communication, make it difficult to achieve high QoE, especially for increasing numbers of users.\n\nCloud Computing opens new opportunities for mobile ROIA to serve very high numbers of users and still comply with QoE demands. This can be accomplished by leasing Cloud resources on demand and offloading computations from mobile devices to more powerful Cloud resources (Fig. 2). Despite a variable number of users, Cloud resources can be used efficiently if the application supports adding/removing resources during runtime.", imageName: "ROIA Cloud"),
    Discussion(title: "Mobile ROIA Challenges", content: "The development of mobile Real-Time Online Interactive Applications (ROIA) faces significant challenges due to the constraints of mobile devices and wireless networks. Limited computational performance and battery life in mobile devices require careful optimization to ensure seamless operation. Additionally, maintaining network reliability and low latency is critical for real-time interactivity, especially in scenarios with a high number of simultaneous users. Balancing these constraints often involves leveraging cloud computing for resource-intensive tasks while minimizing the impact on bandwidth and device power consumption. Developers must also address varying network conditions and user environments to deliver consistent and high-quality experiences."),
    Discussion(title: "The Future of Mobile Computing", content: "The future of mobile computing is poised for transformation through advancements in artificial intelligence (AI), 5G connectivity, and edge computing. AI-driven algorithms will enable devices to adapt to user behavior, enhance security, and improve energy efficiency. The ultra-fast and low-latency capabilities of 5G networks will support real-time applications like autonomous vehicles, smart cities, and immersive virtual experiences. Edge computing will further enhance performance by processing data closer to the source, reducing reliance on centralized cloud infrastructure. Together, these technologies will redefine the possibilities of mobile applications, making them smarter, faster, and more integrated into daily life."),
    Discussion(title: "Emerging Mobile Technologies", content: "Emerging technologies such as augmented and virtual reality (AR/VR), foldable screens, and the Internet of Things (IoT) are shaping the next wave of innovation in mobile computing. AR/VR is transforming how users interact with digital content, offering immersive experiences for gaming, education, and remote collaboration. Foldable screens provide versatile form factors, enabling devices to transition seamlessly between compact and expanded modes for multitasking and media consumption. Meanwhile, IoT integration allows mobile devices to connect and control a growing ecosystem of smart devices, from home automation systems to industrial sensors. These advancements are driving the evolution of mobile technology, fostering creativity and redefining functionality.")
]

// Preview for the BluetoothView
#Preview {
    NavigationStack {
        RealTimeView(showSignInView: .constant(true))
    }
}
