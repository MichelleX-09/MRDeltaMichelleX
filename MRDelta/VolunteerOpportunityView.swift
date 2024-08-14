//
//  VolunteerOpportunityView.swift
//  MRDelta
//
//  Created by Zhifu Xie on 8/4/24.
//

import SwiftUI
import MapKit

struct VolunteerOpportunity: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let eventTime: String
    let eventAddress: String
    let coordinate: CLLocationCoordinate2D
    let detailPageURL: URL?
    let phoneNumber: String
}

struct VolunteerOpportunityView: View {
    @State private var opportunities: [VolunteerOpportunity] = [
        VolunteerOpportunity(
                  title: "Native Seed Drive ",
                  description: " In 2022, CRCL began growing bald cypress and mangroves at our Restoration Headquarters. Now, we need your seeds! We are collecting and planting native, locally grown cypress seeds. Seeds can be collected from a tree in your yard, on the side of the road, or from parking lots. The more seeds we collect the larger our native plant nursery can grow, and the more trees we can plant across the coast. We are currently accepting bald cypress (Taxodium distichum) seed donations! ",
                  eventTime: " MAIL THEM TO CRCL’S NEW ORLEANS OFFICE ",
                  eventAddress: "3801 Canal St. Suite 400, New Orleans, LA 70119 ",
                  coordinate: CLLocationCoordinate2D(latitude:29.973036978564732  , longitude:-90.09750593354319  ),
                  detailPageURL: URL(string: "https://www.crcl.org/native-seed-drive/"),
                  phoneNumber: "(504) 655-7644"
                     ),


              VolunteerOpportunity(
                  title: "Shell-A-Bration ",
                  description: " CRCL will host Shell-A-Bration. A community event dedicated to raising awareness for the Oyster Shell Recycling Program. It will be a night of live music, fresh oysters, delicious food, door prizes, silent auction and more as we celebrate 10 years of our Oyster Shell Recycling Program! ",
                  eventTime: "March 22, 2024  ",
                  eventAddress: "Cajun Ballroom at Audubon Zoo, New Orleans, LA ",
                  coordinate: CLLocationCoordinate2D(latitude:29.919315311000727, longitude:-90.13005742562885),
                  detailPageURL: URL(string: "https://www.crcl.org/special-events/"),
                  phoneNumber: "(504) 655-7644"
                     ),
              VolunteerOpportunity(
                  title: "A TALK WITH IAN MCNULTY ",
                  description: " Ian will discuss the trends influencing New Orleans restaurants now and in particular how traditional Louisiana seafood is changing, and he’ll also field your questions about the New Orleans restaurants scene. ",
                  eventTime: " May 22, 2024 ",
                  eventAddress: "CRCL’S OFFICE IN MID-CITY NEW ORLEANS, ",
                  coordinate: CLLocationCoordinate2D(latitude:29.973120624240003  , longitude:-90.09748447587113  ),
                  detailPageURL: URL(string: "https://www.crcl.org/crcl-lecture-series/"),
                  phoneNumber: "(504) 655-7644"
                     ),


              VolunteerOpportunity(
                  title: " Coastal Stewardship Awards",
                  description: " Restoring and protecting the natural treasure of Louisiana’s coast is a duty embraced by many people with diverse backgrounds. They are volunteers, students, researchers, sportsmen, governmental and business leaders, and sometimes simply coastal residents who care enough about the future of our state to take action. Every year the Coalition to Restore Coastal Louisiana is proud to honor these individuals and organizations demonstrating extraordinary commitment with a Coastal Stewardship Award. These awards are CRCL’s highest form of recognition for those who go above and beyond for our coast. Join us at Solou Baton Rouge on May 9th. General Admission $50.00 ",
                  eventTime: " May 9th, 2024,  6:00 PM  ",
                  eventAddress: "  7246 Perkins Road, Baton Rouge, LA 70808",
                  coordinate: CLLocationCoordinate2D(latitude:30.397271309498368  , longitude:-91.11494473352501  ),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/info?reset=1&id=611"),
                  phoneNumber: "(504) 655-7644"
                     ),


              VolunteerOpportunity(
                  title: "CWRC Convening ",
                  description: "Interested in learning more about restoration work in the Central Wetlands and opportunities to get involved? Join us for our 1st Annual CWRC Convening at Docville Farm.  ",
                  eventTime: "March 27th, 2024 5:30 PM  ",
                  eventAddress: "5124 E Saint Bernard Hwy. Violet, LA 70092 ",
                  coordinate: CLLocationCoordinate2D(latitude:29.91437610076412  , longitude:-89.91011134073655  ),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/info?reset=1&id=669"),
                  phoneNumber: "(504) 655-7644"
                     ),

              
              VolunteerOpportunity(
                  title: "Pontchartrain Conservancy ",
                  description: " Together we will plant over 250 oak trees on historic ridges in St. Bernard Parish. Oak ridge communities provide critical habitat to migratory birds, stabilizes land along our vanishing coastline, and adds resilience against climate change by sequestering atmospheric carbon..  ",
                  eventTime: "Oct 2 2024 9:00 am  ",
                  eventAddress: "2521 Packenham Rd, Violet, LA 70092 ",
                  coordinate: CLLocationCoordinate2D(latitude: 29.900760554710875, longitude:-89.89587219999996  ),
                  detailPageURL: URL(string: "https://www.givepulse.com/event/417452"),
                  phoneNumber: "(847)910-6423"
                     ),

              VolunteerOpportunity(
                  title: "New Isle Tree Planting ",
                  description: " The New Isle is the country's first federally funded resettlement project for communities threatened by climate change. The project resettled residents of Isle de Jean Charles including many members of the Isle de Jean Charles Band of Biloxi-Chitimacha-Choctaw Indians. With your help, CRCL will plant 1,500 native trees near the New Isle Community Center to help restore the ecology of the site from degraded fallow sugarcane fields to forested wetlands.. ",
                  eventTime: "Sep 5th, 2024 9:00 AM  ",
                  eventAddress: " Gray, LA United States",
                  coordinate: CLLocationCoordinate2D(latitude:29.697564201555235  , longitude:-90.78607781421135  ),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/list"),
                  phoneNumber: "(504) 655-7644"
                     ),


              VolunteerOpportunity(
                  title: " CRCL Marsh Planting ",
                  description: " The Coalition to Restore Coastal Louisiana (CRCL) invites you to join us to plant grasses in partnership with the Pointe-au-Chien Indian Tribe, Glass Half Full, Common Ground Relief and the Center for Sustainable Engagement and Design. We will be planting spartina behind a berm of recycled Christmas trees and recycled glass to protect the eroding marsh. ",
                  eventTime: " April 19th, 2024 9:00 AM ",
                  eventAddress: "3798 LA-665 Montegut, LA 70377 United States ",
                  coordinate: CLLocationCoordinate2D(latitude: 29.429627152328926 , longitude:-90.45782604712288),
                  detailPageURL: URL(string: "https://connect.crcl.org/waiver?c1event1=654&c2event1=654"),
                  phoneNumber: "(504) 655-7644"
                     ),

              
              VolunteerOpportunity(
                  title: "Grand Bayou Community Oyster ",
                  description: " The Coalition to Restore Coastal Louisiana (CRCL) is excited to have you join us in Plaquemines Parish! Launched in June 2014, CRCL’s Oyster Shell Recycling Program recycles shell from New Orleans-area restaurants and uses that shell to restore oyster reefs and shoreline habitats across coastal Louisiana. In 2021, CRCL, in partnership with the Grand Bayou Indian Village, completed the construction of the Plaquemines Community Reef to protect a historic mound from further erosion. We are excited to be building a second reef to protect their community from wave action and erosion. Volunteers will be taking a boat ride lasting about 10 minutes from the community center to the project site to deploy the bags of oyster shells. Volunteers are invited but not required to get into the water to construct the reef. We recommend that volunteers prepare to get wet and muddy and bring a change of clothes. A hose is available at the launch site. ",
                  eventTime: " 9/21/24: 10:00AM  ",
                  eventAddress: " Port Sulphur, LA United States",
                  coordinate: CLLocationCoordinate2D(latitude: 29.779578497121626 , longitude: -89.86636560917283 ),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/info?reset=1&id=682"),
                  phoneNumber: "(504) 655-7644"
                     ),


              VolunteerOpportunity(
                  title: "CWRC Marsh Grass Planting",
                  description: "The Central Wetlands Unit was heavily impacted by historic logging and saltwater intrusion from the Mississippi Gulf Outlet (MRGO). What once was a thick and healthy swamp is now mostly marsh and open water. Following the closure of MRGO, the salinity in this area has dropped to where it can once again support cypress trees. Restoring the swamp forest will result in higher quality wildlife habitat, storm surge/wind attenuation, and healthier ecosystems.With your help, CRCL and other CWRC organizations will plant more than 30,000 grass plugs in the Central Wetlands Unit over the next four years.",
                  eventTime: " August 30th, 2024 9:00 AM ",
                  eventAddress: "6207 E St Bernard Highway CRCL's Restoration Headquarters Violet, LA 70092 United States ",
                  coordinate: CLLocationCoordinate2D(latitude:29.899080992744903  , longitude:  -89.79927637762781),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/info?reset=1&id=713"),
                  phoneNumber: "(504) 655-7644"               ),


              VolunteerOpportunity(
                  title: "Native Plant Nursery Care Day  ",
                  description: " CRCL is excited to have you join us in Violet, LA! We will be doing general maintenance at our Restoration Headquarters as well as nursery work. Installed in 2022, CRCL's Native Plant Nursery has grown several hundred trees that will soon be planted. We will be building ponds for our cypress trees to live in through the hot summer months, as well as weeding, watering, and other tasks around CRCL's Restoration Headquarters. ",
                  eventTime: " 10/30/24: 9:00AM  ",
                  eventAddress: "6207 E St Bernard Hwy Violet, LA 70092 United States ",
                  coordinate: CLLocationCoordinate2D(latitude: 29.889080992744903  , longitude:  -89.89927637762781),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/list"),
                  phoneNumber: "(504) 655-7644"
                     ),

              VolunteerOpportunity(
                  title: "Oyster Shell Recycling ",
                  description: " CRCL is excited to have you join us in Violet, LA! Launched in June 2014, CRCL’s Oyster Shell Recycling Program recycles shell from participating New Orleans-based restaurants and uses that shell to restore oyster reefs and shoreline habitat across Coastal Louisiana. As a volunteer, you will help prepare the shell for future restoration. Volunteers will shovel oyster shells into mesh bags to contribute to our next reef build project. Volunteers will also help clean up our shell pile and remove trash and plastics as we bag. By helping prep the shell, volunteers will play a role in creating a new oyster reef that will allow for the growth of new oysters, create new fish habitat, and act as a wave break which will knock down storm surge and allow new land to build up behind the reef. Bags of oyster shells weigh about 30 lbs on average, if this is too strenuous for you, there are many support roles available - such as cutting the mesh bags.  ",
                  eventTime: "10/19/24: 9:00AM  ",
                  eventAddress: " 6207 E St Bernard Highway CRCL's Restoration Headquarters Violet, LA 70092 United States",
                  coordinate: CLLocationCoordinate2D(latitude:  29.899080992744903, longitude: -89.86927637762781 ),
                  detailPageURL: URL(string: "https://connect.crcl.org/civicrm/event/info?reset=1&id=710"),
                  phoneNumber: "(504) 655-7644"
                     )

        
        
    ]

    @State private var selectedOpportunity: VolunteerOpportunity?
    @State private var showingDetailPage = false
    @State private var showInstructionalMessage = true // State for instructional message

    var body: some View {
        NavigationView {
            ZStack {
                MapView(opportunities: $opportunities, selectedOpportunity: $selectedOpportunity, showDetailPage: $showingDetailPage)
                    .edgesIgnoringSafeArea(.all)
                    .sheet(item: $selectedOpportunity) { opportunity in
                        DetailView(opportunity: opportunity)
                    }

                if showInstructionalMessage {
                    VStack {
                        Spacer()
                        Text("Tap the marker to see the description of the event.\nDouble-click for detailed information.")
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()

                        

                        Text("Zoom in for more markers and volunteer opportunity.")
                            .font(.headline)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding()

                        Button(action: {
                            showInstructionalMessage = false // Dismiss the message
                        }) {
                            Text("Got it")
                                .foregroundColor(.black)
                                .fontWeight(.semibold)
                                .font(.title2)
                        }
                        .padding()

                    }
                    .transition(.opacity) // Transition for fading in/out
                }
            }
        }
    }
}

struct MapView: UIViewRepresentable {
    @Binding var opportunities: [VolunteerOpportunity]
    @Binding var selectedOpportunity: VolunteerOpportunity?
    @Binding var showDetailPage: Bool

    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView

        init(parent: MapView) {
            self.parent = parent
        }

        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            let identifier = "Opportunity"
            var view: MKMarkerAnnotationView
            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
                dequeuedView.annotation = annotation
                view = dequeuedView
            } else {
                view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                view.canShowCallout = true

                let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap(_:)))
                doubleTapGesture.numberOfTapsRequired = 2
                view.addGestureRecognizer(doubleTapGesture)
            }
            return view
        }

        @objc func handleDoubleTap(_ gesture: UITapGestureRecognizer) {
            if let view = gesture.view as? MKAnnotationView, let annotation = view.annotation as? OpportunityAnnotation {
                parent.selectedOpportunity = annotation.opportunity
                parent.showDetailPage = true
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.removeAnnotations(uiView.annotations)
        let annotations = opportunities.map { opportunity in
            OpportunityAnnotation(opportunity: opportunity)
        }
        uiView.addAnnotations(annotations)

        if !annotations.isEmpty {
            let latitudes = annotations.map { $0.coordinate.latitude }
            let longitudes = annotations.map { $0.coordinate.longitude }

            let minLat = latitudes.min() ?? 0
            let maxLat = latitudes.max() ?? 0
            let minLon = longitudes.min() ?? 0
            let maxLon = longitudes.max() ?? 0

            let centerLat = (minLat + maxLat) / 2
            let centerLon = (minLon + maxLon) / 2

            let spanLat = maxLat - minLat
            let spanLon = maxLon - minLon

            let span = MKCoordinateSpan(latitudeDelta: max(0.01, spanLat * 1.5), longitudeDelta: max(0.01, spanLon * 1.5))
            let center = CLLocationCoordinate2D(latitude: centerLat, longitude: centerLon)

            let region = MKCoordinateRegion(center: center, span: span)
            uiView.setRegion(region, animated: true)
        }
    }
}

class OpportunityAnnotation: NSObject, MKAnnotation {
    let opportunity: VolunteerOpportunity
    var coordinate: CLLocationCoordinate2D { opportunity.coordinate }
    var title: String? { opportunity.title }
    var subtitle: String? { opportunity.description }

    init(opportunity: VolunteerOpportunity) {
        self.opportunity = opportunity
    }
}

struct DetailView: View {
    let opportunity: VolunteerOpportunity

    var body: some View {
        VStack {
            Text(opportunity.title)
                .font(.largeTitle)
                .padding()
            Text(opportunity.description)
                .padding()
            Text("Event Time: \(opportunity.eventTime)")
                .padding()
            Text("Event Address: \(opportunity.eventAddress)")
                .padding()
            if let detailPageURL = opportunity.detailPageURL {
                Link("Visit the Website to Learn More", destination: detailPageURL)
                    .foregroundColor(.blue)
                    .padding()
            }
            Button(action: {
                if let url = URL(string: "tel://\(opportunity.phoneNumber)") {
                    UIApplication.shared.open(url)
                }
            }) {
                Text("Call \(opportunity.phoneNumber)")
                    .foregroundColor(.blue)
                    .underline()
            }
            Spacer()
        }
        .padding()
        .navigationBarItems(trailing: Button("Back") {
            // Action to go back to the map
            UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
        })
    }
}

#Preview {
    VolunteerOpportunityView()
}

