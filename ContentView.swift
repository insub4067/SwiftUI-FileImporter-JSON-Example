import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State var isShow = false

    var body: some View {
        Button("Import JSON") {
            self.isShow = true
        }
        .fileImporter(
            isPresented: $isShow,
            allowedContentTypes: [.json],
            onCompletion: { result in
                
                guard
                    let url = try? result.get(),
                    url.startAccessingSecurityScopedResource()
                else { return }
                
                defer { url.stopAccessingSecurityScopedResource() }

                if let jsonData = try? Data(contentsOf: url),
                   let json = try? JSONSerialization.jsonObject(with: jsonData) {
                    print(json)
                }

                if let jsonString = try? String(contentsOf: url) {
                    print(jsonString)
                }
            }
        )
    }
}
