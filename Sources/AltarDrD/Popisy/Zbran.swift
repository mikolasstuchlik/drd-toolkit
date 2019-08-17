public protocol SchopnyDrzetZbran {
    var drzenaZbran: Zbran { get }
}

// PPZ-PH:68
public enum TypZbrane {
    case jednorucni, obourucni
}

// PPZ-PH:68
public protocol Zbran {
    var typ: TypZbrane { get }
    var jmeno: String { get }
    var sila: Int { get }
    var utocnost: Int { get }
    var obrana: Int { get }
    // TODO: Implementovat rozšířený soubojový systém
    // var delka: Int { get }
    var vaha: Int { get }
    var cena: Int { get }
}