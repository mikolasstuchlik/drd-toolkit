public extension Tabulka {

    // PPZ-PH:27
    static func postihNeboBonus(proAtribut velikosti: Int ) -> Int {
        switch velikosti {
        case (Int.min)...1:
            return -5
        case 2...3:
            return -4
        case 4...5:
            return -3
        case 6...7:
            return -2
        case 8...9:
            return -1
        case 10...12:
            return 0
        case 13...14:
            return 1
        case 15...16:
            return 2
        case 17...18:
            return 3
        case 19...20:
            return 4
        case 21...(Int.max):
            return 5
        default:
            return 0
        }
    } 

    // PPZ-PH:71
    static func postihZaZivotyAOdolnost(_ hrdina: AtributZivoty & AtributOdolnost) -> Int{

        if hrdina.maximalniZivoty / 3 <= hrdina.soucasneZivoty {
            return 0
        }

        switch hrdina.odolnost {
        case 1...5:
            return -3
        case 6...11:
            return -2
        case 12...16:
            return -1
        case 17...21:
            return 0
        default:
            return 0
        }
    }
}

public protocol AtributZivoty {
    var maximalniZivoty: Int { get }
    var soucasneZivoty: Int { get }
}

// PPZ-PH:26
public protocol AtributSila {
    var sila: Int { get }
}

// PPZ-PH:26
public protocol AtributObratnost {
    var obratnost: Int { get }
}

// PPZ-PH:26
public protocol AtributOdolnost {
    var odolnost: Int { get }
}

// PPZ-PH:26
public protocol AtributInteligence {
    var inteligence: Int { get }
}

// PPZ-PH:26
public protocol AtributCharisma {
    var charisma: Int { get }
}

