//
//  RouteLocationDetailView.swift
//  Individual Project
//
//  Created by chan yuk han on 27/8/2024.
//

import SwiftUI
import MapKit
import SwiftData

struct RouteLocationDetailView: View {
    @Environment(\.dismiss) private var dismiss
    var destination: Destination?
    var selectedLocation: ToileLocation?
    @Binding var showRoute: Bool
    @Binding var travelInterval: TimeInterval?
    @Binding var transportType: MKDirectionsTransportType
    
    var travelTime: String? {
        guard let travelInterval else { return nil }
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: travelInterval)
    }
    
    @State private var name = ""
    @State private var address = ""
    
    @State private var lookaroundScene: MKLookAroundScene?
    
    var isChanged: Bool {
        guard let selectedLocation else { return false }
        return (name != selectedLocation.name || address != selectedLocation.address)
    }
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    if destination != nil {
                        TextField("Name", text: $name)
                            .font(.title)
                        TextField("address", text: $address, axis: .vertical)
                        if isChanged {
                            Button("Update") {
                                selectedLocation?.name = name
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                                selectedLocation?.address = address
                                    .trimmingCharacters(in: .whitespacesAndNewlines)
                            }
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .buttonStyle(.borderedProminent)
                        }
                    } else {
                        Text(selectedLocation?.name ?? "")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(selectedLocation?.address ?? "")
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.trailing)
                    }
                    if destination == nil {
                        HStack {
                            Button {
                                transportType = .automobile
                            }label: {
                                Image(systemName: "car")
                                    .symbolVariant(transportType == .automobile ? .circle : .none)
                                    .imageScale(.large)
                            }
                            Button {
                                transportType = .walking
                            }label: {
                                Image(systemName: "figure.walk")
                                    .symbolVariant(transportType == .walking ? .circle : .none)
                                    .imageScale(.large)
                            }
                            if let travelTime {
                                let prefix = transportType == .automobile ? "Driving" : "Walking"
                                Text("\(prefix) time: \(travelTime)")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                Spacer()
                Button {
                   dismiss()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .imageScale(.large)
                        .foregroundStyle(.gray)
                }
            }
            if let lookaroundScene {
                LookAroundPreview(initialScene: lookaroundScene)
                    .frame(height: 200)
                    .padding()
            } else {
                ContentUnavailableView("No preview available", systemImage: "eye.slash")
            }
            HStack {
                Spacer()
                if let destination {
                    let inList = (selectedLocation != nil && selectedLocation?.destination != nil)
                    Button {
                        if let selectedLocation {
                            if selectedLocation.destination == nil {
                                destination.placemarks.append(selectedLocation)
                            } else {
                                selectedLocation.destination = nil
                            }
                            dismiss()
                        }
                    } label: {
                        Label(inList ? "Remove" : "Add", systemImage: inList ? "minus.circle" : "plus.circle")
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(inList ? .red : .green)
                    .disabled((name.isEmpty || isChanged))
                } else {
                    HStack {
                        Button("Open in maps", systemImage: "map") {
                            if let selectedLocation {
                                let placemark = MKPlacemark(coordinate: selectedLocation.coordinate)
                                let mapItem = MKMapItem(placemark: placemark)
                                mapItem.name = selectedLocation.name
                                mapItem.openInMaps()
                            }
                        }
                        .fixedSize(horizontal: true, vertical: false)
                        Button("Show Route", systemImage: "location.north") {
                            showRoute.toggle()
                        }
                        .fixedSize(horizontal: true, vertical: false)
                    }
                    .buttonStyle(.bordered)
                }
            }
            Spacer()
        }
        .padding()
        .task(id: selectedLocation) {
            await fetchLookaroundPreview()
        }
        .onAppear {
            if let selectedLocation, destination != nil {
                name = selectedLocation.name
                address = selectedLocation.address
            }
        }
    }
    func fetchLookaroundPreview() async {
        if let selectedLocation {
            lookaroundScene = nil
            let lookaroundRequest = MKLookAroundSceneRequest(coordinate: selectedLocation.coordinate)
            lookaroundScene = try? await lookaroundRequest.scene
        }
    }
}

#Preview("Destination Tab") {
    let container = Destination.preview
    let fetchDescriptor = FetchDescriptor<Destination>()
    let destination = try! container.mainContext.fetch(fetchDescriptor)[0]
    let selectedLocation = destination.placemarks[0]
    return RouteLocationDetailView(
        destination: destination,
        selectedLocation: selectedLocation,
        showRoute: .constant(false),
        travelInterval: .constant(nil),
        transportType: .constant(.automobile)
    )
}
