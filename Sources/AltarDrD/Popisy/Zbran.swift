public protocol SchopnyDrzetZbran {
    var drzenaZbran: Zbran { get }
}

public enum Zbran {
    case naBlizko(ZbranNaBlizko)
    case naDalku(ZbranNaDalku)
}

// PPZ-PH:68
public enum DrzeniZbrane {
    case jednorucni, obourucni
}

// PPZ-PH:68
public enum TypZbrane {
    case lehke, stredni, tezke
}

// PPZ-PH:68
public protocol ZbranNaBlizko {
    var typ: TypZbrane { get }
    var drzeni: DrzeniZbrane { get }
    var jmeno: String { get }
    var sila: Int { get }
    var utocnost: Int { get }
    var obrana: Int { get }
    // TODO: Implementovat rozšířený soubojový systém
    // var delka: Int { get }
    var vaha: Int { get }
    var cena: Int { get }
}

public protocol ZbranNaDalku {

}