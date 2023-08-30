
import Foundation
import CoreData
import SwiftUI
import Combine

class ViewModel: ObservableObject {
    @Published var nota = ""
    @Published var fecha = Date()
    @Published var show = false
}
