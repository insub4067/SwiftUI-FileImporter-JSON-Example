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
                let url = try? result.get()
                guard let url else { return }
                
                let jsonString = try? String(contentsOf: url)
                guard let jsonString else { return }
                
                let jsonData = try? Data(contentsOf: url)
                guard let jsonData else { return }
            }
        )
    }
}
