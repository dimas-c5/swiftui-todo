import SwiftUI

struct Todo : View {

    @State var textInput: String = ""

    var body: some View {
        TextField($textInput, placeholder: Text("Add Todo"), onEditingChanged: { changed in
            print("onEditing: \(changed)")
        }) {
        }
//        List {
//            Text("Todo")
//        }
    }
}

#if DEBUG
struct Todo_Previews : PreviewProvider {
    static var previews: some View {
        Todo()
    }
}
#endif
