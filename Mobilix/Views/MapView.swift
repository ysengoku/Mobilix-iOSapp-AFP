//
//  ContentView.swift
//  MapExample
//


import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 45.755006, longitude: 4.831828), span: MKCoordinateSpan(latitudeDelta: 0.020, longitudeDelta: 0.080))
    
    @State var filterdPlace: [Place] = places
    @State private var filterValueIndex = 0
    @State private var filterValues: [Mobility] = [.bicycle, .scooter, .car]
    @State private var filterChoices: [String] = ["bicycle", "scooter", "car.fill"]
    
    @State private var selectedPlace: Place? = nil
    
    var listPlace: [Place] = places
    
    
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().backgroundColor = UIColor.white.withAlphaComponent(0.2)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor .gray], for: .normal)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor( red: 111/255, green: 133/255, blue: 41/255, alpha: 1)], for: .selected)
    }
    
    
    
    
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                Picker("Filter", selection: $filterValueIndex) {
                    ForEach(filterChoices.indices, id: \.self) {
                        Image(systemName: "\(filterChoices[$0])")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .scaleEffect(x: 1, y: 1.2)
                .padding(.horizontal, 25)
                
                
                Map(coordinateRegion: $region,showsUserLocation: true, annotationItems: places.filter { $0.mobility.rawValue == filterValues[filterValueIndex].rawValue}) { place in
                    
                    MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude)) {
                        
                        VStack {
                            Button {
                                self.selectedPlace = place
                            } label: {
                                
                                ZStack {
                                    Image(systemName: "circle.fill")
                                        .font(.title2)
                                    Image(systemName: "arrowtriangle.down.fill")
                                        .position(x: 13.3, y: 24)
                                }
                                .foregroundColor(.pink)

                            }
                            .sheet(item: self.$selectedPlace){ place in
                                
                                MapDetailView(placeDetail: place)
                                    .presentationDetents([.medium, .large])
                                
                            }
                            

                        }
                                
                    }
                    
                }
                
            }

            .navigationBarTitle("Lyon")
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
