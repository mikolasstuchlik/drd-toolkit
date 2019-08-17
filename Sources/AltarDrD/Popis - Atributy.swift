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
    
}

// PPZ-PH:23
public protocol AtributVelikost {
    var velikost: TridaVelikosti { get }
}

// PPZ-PH:68
public protocol AtributRodovaZbran {
    var rodoveZbrane: Set<String> { get }
}

// PPZ-PH:26
public protocol AtributSila {
    var sila: Int { get }
}