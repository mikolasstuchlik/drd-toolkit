import Foundation

// MARK: - Příklad RPGCommons

protocol PočítáníŽivotů {
    var životy: UInt { get set }
}

protocol JménoHráče {
    var jménoHráče: String { get set }
}

protocol JménoPostavy {
    var jménoPostavy: String { get set }
}

// MARK: - Příklad DRD

protocol MožnostÚtočit {
    var základníÚtok: UInt { get set }
}

protocol MožnostBránit: PočítáníŽivotů {
    var základníObrana: UInt { get set }
}

extension MožnostBránit {
    mutating func odrážíÚtok<Útočník: MožnostÚtočit>(útočníka útočník: Útočník, hodNaObranu: UInt, hodNaÚtok: UInt){
        self.životy = základníObrana + hodNaObranu - útočník.základníÚtok - hodNaÚtok
    }
}

protocol Nebezpečnost {
    var nebezpečnost: UInt { get set }
}

typealias DRDStvoření = PočítáníŽivotů & MožnostÚtočit & MožnostBránit
typealias DRDPostava = DRDStvoření & JménoPostavy
typealias DRDHráč = DRDPostava & JménoHráče 

protocol DRDNestvůra: DRDStvoření, Nebezpečnost { }

extension DRDNestvůra {
    var základníObrana: UInt {
        return nebezpečnost
    }
}


// MARK: - Příklad DND



// MARK: - Příklad RPGUI

// MARK: - Příklad sestavení pro pána jeskyně