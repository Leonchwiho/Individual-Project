//
//  RouteMapView.swift
//  Individual Project
//
//  Created by chan yuk han on 25/8/2024.
//

import SwiftUI
import MapKit
import SwiftData

struct RouteMapView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var Region: MKCoordinateRegion?
    @Environment(RouteLocationManager.self) var routelocationManager
    @State private var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    @Query private var listLocations: [ToileLocation]
    
    @State private var searchText = ""
    @FocusState private var searchFieldFocus: Bool
    @Query(filter: #Predicate<ToileLocation> {$0.destination == nil}) private var searchPlacemarks: [ToileLocation]
    
    @State private var selectedLocation: ToileLocation?
    
    @State private var showRoute = false
    @State private var routeDisplaying = false
    @State private var route: MKRoute?
    @State private var routeDestination: MKMapItem?
    @State private var travelInterval: TimeInterval?
    @State private var transportType = MKDirectionsTransportType.automobile
    @State private var showSteps = false
    
    var body: some View {
        Map(position: $cameraPosition, selection: $selectedLocation) {
            UserAnnotation()
            ForEach(listLocations) { placemark in
                if !showRoute {
                    Group {
                        if placemark.destination != nil {
                            Marker(coordinate: placemark.coordinate) {
                                Label(placemark.name, systemImage: "toilet")
                            }
                            .tint(.red)
                        } else {
                            Marker(placemark.name, coordinate: placemark.coordinate)
                        }
                    }.tag(placemark)
                } else {
                    if let routeDestination {
                        Marker(item: routeDestination)
                            .tint(.green)
                    }
                }
            }
            if let route, routeDisplaying {
                MapPolyline(route.polyline)
                    .stroke(.blue, lineWidth: 6)
            }
        }
        .sheet(item: $selectedLocation) { selectedLocation in
            RouteLocationDetailView(
                selectedLocation: selectedLocation,
                showRoute: $showRoute,
                travelInterval: $travelInterval,
                transportType: $transportType
            )
                .presentationDetents([.height(450)])
        }
        .onMapCameraChange{ context in
            Region = context.region
        }
        .onAppear {
            RouteMapManager.removeSearchResults(modelContext)
            updateCameraPosition()
        }
        .mapControls{
            MapUserLocationButton()
        }
        .task(id: selectedLocation) {
            if selectedLocation != nil {
                routeDisplaying = false
                showRoute = false
                route = nil
                await fetchRoute()
            }
        }
        .onChange(of: showRoute) {
            selectedLocation = nil
            if showRoute {
                withAnimation {
                    routeDisplaying = true
                    if let rect = route?.polyline.boundingMapRect {
                        cameraPosition = .rect(rect)
                    }
                }
            }
        }
        .task(id: transportType) {
            await fetchRoute()
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack {
                    TextField("Search...", text: $searchText)
                        .textFieldStyle(.roundedBorder)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .focused($searchFieldFocus)
                        .overlay(alignment: .trailing) {
                            if searchFieldFocus {
                                Button {
                                    searchText = ""
                                    searchFieldFocus = false
                                } label: {
                                    Image(systemName: "xmark.circle.fill")
                                }
                                .offset(x: -5)
                            }
                        }
                        .onSubmit {
                            Task {
                                await RouteMapManager.searchLocation(
                                    modelContext,
                                    searchText: searchText,
                                    Region: Region
                                )
                                searchText = ""
                            }
                        }
                    if routeDisplaying {
                        HStack {
                            Button("Clear Route", systemImage: "xmark.circle") {
                                removeRoute()
                            }
                            .buttonStyle(.borderedProminent)
                            .fixedSize(horizontal: true, vertical: false)
                            Button("Show Steps", systemImage: "location.north") {
                                showSteps.toggle()
                            }
                            .buttonStyle(.borderedProminent)
                            .fixedSize(horizontal: true, vertical: false)
                            .sheet(isPresented: $showSteps) {
                                if let route {
                                    NavigationStack {
                                        List {
                                            HStack {
                                                Image(systemName: "mappin.circle.fill")
                                                    .foregroundStyle(.red)
                                                Text("From my location")
                                                Spacer()
                                            }
                                            ForEach(1..<route.steps.count, id: \.self) { idx in
                                                VStack(alignment: .leading) {
                                                    Text("\(transportType == .automobile ? "Drive" : "Walk") \(RouteMapManager.distance(meters: route.steps[idx].distance))")
                                                        .bold()
                                                    Text(" - \(route.steps[idx].instructions)")
                                                }
                                            }
                                        }
                                        .listStyle(.plain)
                                        .navigationTitle("Steps")
                                        .navigationBarTitleDisplayMode(.inline)
                                    }
                                }
                            }
                        }
                    }
                }
                .padding()
                VStack {
                    if !searchPlacemarks.isEmpty {
                        Button {
                            RouteMapManager.removeSearchResults(modelContext)
                        } label: {
                            Image(systemName: "mappin.slash")
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                }
                .padding()
                .buttonBorderShape(.circle)
            }
        }
    }
    
    func updateCameraPosition() {
        if let userLocation = routelocationManager.userLocation {
            let userRegion = MKCoordinateRegion(
                center: userLocation.coordinate,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.15,
                    longitudeDelta: 0.15
                )
            )
            withAnimation {
                cameraPosition = .region(userRegion)
            }
        }
    }
    
    func fetchRoute() async {
        if let userLocation = routelocationManager.userLocation, let selectedLocation {
            let request = MKDirections.Request()
            let sourcePlacemark = MKPlacemark(coordinate: userLocation.coordinate)
            let routeSource = MKMapItem(placemark: sourcePlacemark)
            let destinatinPlacemark = MKPlacemark(coordinate: selectedLocation.coordinate)
            routeDestination = MKMapItem(placemark: destinatinPlacemark)
            routeDestination?.name = selectedLocation.name
            request.source = routeSource
            request.destination = routeDestination
            request.transportType = transportType
            let directions = MKDirections(request: request)
            let result = try? await directions.calculate()
            route = result?.routes.first
            travelInterval = route?.expectedTravelTime
        }
    }
    
    func removeRoute() {
        routeDisplaying = false
        showRoute = false
        route = nil
        selectedLocation = nil
        updateCameraPosition()
    }
}

#Preview {
    RouteMapView()
        .environment(RouteLocationManager())
        .modelContainer(Destination.preview)
}
