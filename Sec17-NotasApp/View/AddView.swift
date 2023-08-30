
import SwiftUI

struct AddView: View {
    
    @ObservedObject var model: ViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            Text(model.updateNota != nil ? "Editar Nota" : "Agregar Nota")
                .font(.largeTitle)
                .bold()
            Spacer()
            TextEditor(text: $model.nota)
            Divider()
            DatePicker("Seleccionar Fecha", selection: $model.fecha)
            Spacer()
            Button(action:{
                if model.updateNota != nil {
                    model.editData(context: context)
                } else {
                    model.saveData(context: context)
                }
            }){
                Label(
                    title: {Text("Guardar").foregroundColor(.white).bold()},
                    icon: { Image(systemName: "plus").foregroundColor(.white)}
                )
            }.padding()
            .frame(width: UIScreen.main.bounds.width - 30)
            .background(model.nota == "" ? Color.gray : Color.blue)
            .cornerRadius(8)
            .disabled(model.nota == "" ? true : false)
            
            
        }.padding()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(model: ViewModel())
    }
}
