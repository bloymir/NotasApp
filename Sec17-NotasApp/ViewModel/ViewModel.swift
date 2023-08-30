
import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    
    
//    CoreData
    
    func saveData(context: NSManagedObjectContext){
        let newNota = Notas(context: context)
        
        newNota.nota = nota
        newNota.fecha = fecha
        
        do {
            try context.save()
            print("Guardado")
            show.toggle()
        } catch let error as NSError {
            //Alerta al usuario
            print("No guardo ", error.localizedDescription)
        }
    }
}
