public extension Tabulka {

    // PPZ-PH:83
    static func nosnost(jednotky jednotka: AtributSila) -> Int {
        let bonusZaSilu = Tabulka.postihNeboBonus(proAtribut: jednotka.sila)

        switch bonusZaSilu {
        case -5:
            return 210
        case -4:
            return 240
        case -3:
            return 270
        case -2:
            return 300
        case -1:
            return 330
        case 0:
            return 360
        case 1:
            return 390
        case 2:
            return 420
        case 3:
            return 450
        case 4:
            return 480
        case 5:
            return 510
        default:
            return 360
        }
    }

    // PPZ-PH:83
    static func miraNalozeni(jednotky jednotka: AtributSila & Nalozeni) -> MiraNalozeni {
        switch jednotka.aktualniNalozeni / Tabulka.nosnost(jednotky: jednotka) {
        case (Int.min)...1:
            return .zadne
        case 1...2:
            return .mirne
        case 2...3:
            return .stredni
        default:
            return .velke
        }
    }
}

// PPZ-PH:83
public protocol Nalozeni {
    var aktualniNalozeni: Int { get }
}

// PPZ-PH:83
public enum MiraNalozeni {
    case zadne, mirne, stredni, velke
}