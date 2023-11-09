import SwiftUI
import MapKit

struct MapView: NSViewRepresentable {
    @Binding var region: MKCoordinateRegion
    var annotations: [MKPointAnnotation]
    var onCoordinateChange: (CLLocationCoordinate2D) -> Void
    
    func makeNSView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        nsView.setRegion(region, animated: true)
        updateAnnotations(for: nsView)
    }
    
    private func updateAnnotations(for mapView: MKMapView) {
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self, onCoordinateChange: onCoordinateChange)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        var onCoordinateChange: (CLLocationCoordinate2D) -> Void
        
        init(_ parent: MapView, onCoordinateChange: @escaping (CLLocationCoordinate2D) -> Void) {
            self.parent = parent
            self.onCoordinateChange = onCoordinateChange
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            onCoordinateChange(mapView.centerCoordinate)
        }
    }
}

struct ContentView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 21.1289507, longitude: -101.6899912), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)) // Region
    @State private var address: String = ""
    @State private var annotations: [MKPointAnnotation] = []
    @State private var searchList: [String] = ["La Salle Bajío"]
    
    var body: some View {
        HSplitView {
            MapView(region: $region, annotations:
                        annotations, onCoordinateChange: { _ in
                
            }).frame(minWidth: 500, maxWidth: .infinity, maxHeight: .infinity)
            
            VStack {
                VStack {
                    Text("Buscar").font(.headline)
                    TextField("Ingresa la dirección", text: $address).onSubmit {
                        searchForAdress()
                    }
                    Button("Buscar") {
                        searchForAdress()
                    }
                }
                List(Array(searchList.enumerated()), id: \.offset) { search in
                    HStack {
                        Text(search.element)
                        Spacer()
                        Button(action: {
                            address = search.element
                            searchForAdress()
                        }, label: {
                            Image(systemName: "magnifyingglass")
                        })
                    }
                }
                Spacer()
            }.padding().frame(minWidth: 300, maxWidth: .infinity, maxHeight: .infinity) // VStack
        }.frame(minWidth: 500, maxWidth: .infinity, maxHeight: .infinity) // HSplitView
    }
    
    private func searchForAdress() {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = address
        request.region = region
        
        let search = MKLocalSearch(request: request)
        
        search.start(completionHandler: { response, error in
            guard let response = response else {
                print("Error: \(error?.localizedDescription ?? "Sabrá dios que pasó.")")
                return
            }
            
            // Obtener el primer resultado
            if let firstItem = response.mapItems.first {
                let annotation = MKPointAnnotation()
                annotation.coordinate = firstItem.placemark.coordinate
                let annotationTitle = firstItem.name ?? "Unknown"
                searchList.append(annotationTitle)
                
                withAnimation {
                    region.center = annotation.coordinate
                    annotations.removeAll()
                }
                
                annotations.append(annotation)
            }
        })
    }
}

#Preview {
    ContentView()
}
