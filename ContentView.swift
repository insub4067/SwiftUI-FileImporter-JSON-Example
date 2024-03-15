import SwiftUI
import UniformTypeIdentifiers

import SwiftUI
import UniformTypeIdentifiers

struct ContentView: View {
    
    @State var isShow = false

    var body: some View {
        Button("Button") {
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
                
                let jsonString = try? String(contentsOf: url)
                guard let jsonString else { return }
                
                let jsonData = try? Data(contentsOf: url)
                guard let jsonData else { return }
            }
        )
    }
}
