import SwiftUI

class MyModel: ObservableObject {
    @Published var text = ""
    var undoManager = UndoManager()
}

struct ContentView: View {
    @StateObject private var viewModel = MyModel()
    @Environment(\.undoManager) var undoManager
    
        
    var body: some View {
        VStack {
            TextField("Type something", text: $viewModel.text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Undo") {
                undoManager?.undo()
            }
            
            .padding()

            Button("Redo") {
                undoManager?.redo()
            }
            .padding()
        }
        .environment(\.undoManager, viewModel.undoManager)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
