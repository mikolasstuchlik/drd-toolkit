
/// Toto je experimentální funkce kompilátoru - function builder. Slouží především k implementaci tzv. DSL (Domain Specific Language). Jedná se vlasně o formu marka ve Swiftu, které nám umožňuje vytvářet mechaniky. DSL sice umožňují používat podmínky atd. my ale nic z toho v mechanikách používat nebudeme.
@_functionBuilder
public class Mechanika {

    public static func buildBlock<T>(_ children: Krok<T>...) -> Krok<T> {
        // Nikdy nebude 0
        var prvni = children[0]
        for item in children.dropFirst() {
            prvni.dalsiKrok = item
            prvni = item
        }
        return children[0]
    }

}

/// Kontext je třída, kterou budeme vkládat do instance mechanik. Pomocí ní potom UI bude moct vyčítat vnitřní chování mechaniky a vkládat do ní hodnotu.
open class Kontext {
    // TODO: Implementovat kontext pro sledování a injectování hodnot a mechanik
}

/// Tento protokol slouží k tomu, abychom mohli ukládat více instancí Krok do pole bez ohledu na jejich generický typ.
protocol Sledovatelny: AnyObject {
    var uuid: UUID { get }
    var popis: String { get }
    var kontext: Kontext? { get set }
}

/// Krok je základní element mechaniky. Jedná se o generickou třídu kde generický typ T specifikuje výstup tohoto kroku. Krok obsahuje zpravidla label který ho popisuje uvnitř mechaniky (z programátorského hlediska se *ne*jedná i ID) a imperativního bloku, který provádí výpočty nad proměnnými dostupnými Kroku. Existují kroky primitivní a kroky s podkroky. Liší se tím, že krok s podkroky má krom imperativního bloku ještě blok obsahující podkroky. Všechny kroky v daném bloku musí mít stejný generický typ. Krok s podkroky ve svém imperativním bloku dostane na vstup pole výstupů z podkroků a na výstup da instanci svého generickeho typu.
open class Krok<T>: Sledovatelny {

    /// Rozlišuje mezi krokem a krokem s podkroky
    private enum Operace {
        case jednoducha(()->T)
        case sPodkroky(podkroky: Sledovatelny, operace: ()->T)
    }
    
    private let operace: Operace
    
    /// Popis viditelný uživateli skrze kontext
    open let popis: String
    
    /// Krok následující po tomto kroku
    var dalsiKrok: Krok<T>?
    
    /// UUID pro kontext a další dynamické funkce
    var uuid = UUID()
    
    /// Kontext (po vložení se automaticky distribuuje do dalších kroků a podkroků)
    var kontext: Kontext? {
        didSet {
            vlozNovyKontext()
        }
    }

    
    /// Instancuje nový krok
    /// - Parameter popis: popis kroku viditelná skrze kontext
    /// - Parameter operace: imperativní blok vykonaný při aktivaci mechaniky
    public init(_ popis: String, operace: @escaping ()->T) {
        self.popis = popis
        self.operace = .jednoducha(operace)
    }
    
    
    /// Pomocný konstruktor, v době programování nebylo možné vložit do konstruktoru jako argument building block.
    /// - Parameter popis: popis kroku viditelný skrze kontext
    /// - Parameter operace: imperativní blok vykonaný při aktivaci mechaniky, obsahuje kompozici funkce reduce a mechaniky vzniklé z podkorků
    /// - Parameter podkrok: netypovaná reference na podkrok za účelem vkládání kontextu
    private init(_ popis: String, operace: @escaping (()->T), podkrok: Sledovatelny ){
        self.popis = popis
        self.operace = Operace.sPodkroky(podkroky: podkrok, operace: operace)
    }

    
    /// Tzv. Factory metoda pro vytváření kroku s podkroky
    /// - Parameter popis: popis kroku viditelný skrze kontext
    /// - Parameter reduce: imperativní metoda která dostane na vstup pole výstupů z vnořených kroků a na výstup vloží instanci vlastního generického typu (nebo Void)
    /// - Parameter operace: blok podkroků stejného generického typu
    public static func sPodkorky<U>(_ popis: String, reduce: @escaping (([U])->T), @MechanicBuilder _ operace:  (()->Krok<U>) ) -> Krok<T> {
        let mechanika = operace()
        return Krok.init(popis, operace: { reduce(mechanika.evaluate(in: [])) }, podkrok: mechanika)
    }

    
    /// Metoda sloužící pro "vykonání" mechaniky. Mechanika bude vyhodnocena znovu. Pokud v kontextu přibudou nebo ubudou přednastavené hodnoty, změny se projevý na výstupu
    open func vykonej() -> T {
        switch operace {
            case .jednoducha(let funkce), .sPodkroky(podkroky: _, operace: let funkce):
            return funkce()
        }
    }

    
    /// Vnitřní metoda pro vykonání korku s podkroky. Má navíc pole, do kterého ukládá hodnoty.
    /// - Parameter kontextPodkroku: nemá nic společného s "kontextem" - jedná se pouze o pole kam příslušný podkrok ukládá své výstupy
    private func evaluate(in kontextPodkroku:[T]) -> [T] {
        if let dalsiKrok = dalsiKrok {
            return dalsiKrok.evaluate(in: kontextPodkroku + [vykonej()])
        }
        return kontextPodkroku + [vykonej()]
    }

    /// Metoda distribuující kontext do podkroků a následujících kroků
    private func vlozNovyKontext() {
        dalsiKrok?.kontext = kontext
        switch operace {
        case .sPodkroky(podkroky: let podkrok, operace: _):
            podkrok.kontext = kontext
        default:
            break
        }
    }
}
