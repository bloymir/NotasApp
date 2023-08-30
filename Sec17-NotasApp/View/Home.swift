
import SwiftUI

struct Home: View {
    
    @StateObject var model = ViewModel()
    
    var body: some View {
        
        Button(action:{
            model.show.toggle()
        }){
            Image(systemName: "plus")
        }.sheet(isPresented: $model.show) {
            AddView(model: model)
        }
    }
}

