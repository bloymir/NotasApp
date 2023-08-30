
import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
    @Published var updateNota: Notas!
    
    
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
    
    func deleteData(item: Notas, context: NSManagedObjectContext){
        context.delete(item)
        
        //try! context.save()
        do {
            try context.save()
            print("Elimino")
        } catch let error as NSError {
            //Alerta al usuario
            print("No elimino ", error.localizedDescription)
        }
    }
    
    func sendData(item: Notas){
        updateNota = item
        nota = item.nota ?? ""
        fecha = item.fecha ?? Date()
        show.toggle()
    }
    
    func editData(context: NSManagedObjectContext){
        updateNota.fecha = fecha
        updateNota.nota = nota
        
        do {
            try context.save()
            show.toggle()
            print("Editado")
        } catch let error as NSError {
            //Alerta al usuario
            print("No editado ", error.localizedDescription)
        }
        
    }
}
