import Foundation

@_functionBuilder
public class MechanicBuilder {

    public static func buildBlock<T>(_ children: Krok<T>...) -> Krok<T> {
        var previous = children[0]
        for item in children.dropFirst() {
            previous.dalsiKrok = item
            previous = item
        }
        return children[0]
    }

}

public class Kontext {

    public struct Element {
        let uuid: UUID
        let popis: String
        let vnorene: [Element]
        let hodnota: String
    }
    

    fileprivate func vloz(sebe: Sledovatelny, navazujici: Sledovatelny?, vnoreny: Sledovatelny?){

    }

    func vloz<T>(hodnotu: T, pro objektId: UUID){
        
    }

    func vlozenaHodnota<T>(pro objektId: UUID) -> T? {
        return nil
    }

}

fileprivate protocol Sledovatelny: AnyObject {
    var uuid: UUID { get }
    var popis: String { get }
    var kontext: Kontext? { get set }
}

public class Krok<T>: Sledovatelny {

    private enum Operace {
        case jednoducha(()->T)
        case sPodkroky(podkroky: Sledovatelny, operace: ()->T)
    }

    let popis: String
    private let operace: Operace
    fileprivate var dalsiKrok: Krok<T>? 
    fileprivate var uuid = UUID()
    fileprivate var kontext: Kontext? {
        didSet {
            vlozNovyKontext()
            vyplnKontext()       
        }
    }

    init(_ popis: String, operace: @escaping ()->T) {
        self.popis = popis
        self.operace = .jednoducha(operace)
    }
    
    private init(_ popis: String, operace: @escaping (()->T), podkrok: Sledovatelny ){
        self.popis = popis
        self.operace = Operace.sPodkroky(podkroky: podkrok, operace: operace)
    }

    static func sPodkorky<U>(_ popis: String, reduce: @escaping (([U])->T), @MechanicBuilder _ operace:  (()->Krok<U>) ) -> Krok<T> {
        let mechanika = operace()
        return Krok.init(popis, operace: { reduce(mechanika.evaluate(in: [])) }, podkrok: mechanika)
    }

    func evaluate() -> T {
        switch operace {
            case .jednoducha(let funkce), .sPodkroky(podkroky: _, operace: let funkce):
            return funkce()
        }
    }

    private func evaluate(in context:[T]) -> [T] {
        if let dalsiKrok = dalsiKrok {
            return dalsiKrok.evaluate(in: context + [evaluate()])
        }
        return context + [evaluate()]
    }

    private func vlozNovyKontext() {
        dalsiKrok?.kontext = kontext
        switch operace {
        case .sPodkroky(podkroky: let podkrok, operace: _):
            podkrok.kontext = kontext
        default:
            break
        }
    }

    private func vyplnKontext(){

    }
}

@MechanicBuilder 
func createMechanic(obrana: Int, utok: Int, zdraviMax: Int, soucasneZdravi: Int) -> Krok<Void> {
    Krok<Void>.sPodkorky("Hlavni", reduce:  { _ in print("Hlavni") } ) { 
        Krok<Void>("a", operace: {print("a")})
        Krok<Void>("b", operace: {print("b")})
        Krok<Void>("c", operace: {print("c")})

        Krok<Void>.sPodkorky("mensi", reduce: { _ in print("mensi") } ) { 
            Krok<Void>("1", operace: {print("1")})
            Krok<Void>("2", operace: {print("2")})
            Krok<Void>("3", operace: {print("3")})
        
            Krok<Void>.sPodkorky("nejmensi", reduce:  { _ in print("nejmensi") } ) { 
                Krok<Void>("1a", operace: {print("1a")})
                Krok<Void>("2b", operace: {print("2b")})
                Krok<Void>("3c", operace: {print("3c")})
        
            }
        } 
    } 
}

let mechanika = createMechanic(obrana: 5, utok: 10, zdraviMax: 100, soucasneZdravi: 40)

print(mechanika.evaluate())
