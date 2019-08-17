struct VychoziZbran: Zbran {
    let typ: TypZbrane
    let drzeni: DrzeniZbrane
    let jmeno: String
    let sila: Int
    let utocnost: Int
    let obrana: Int
    let vaha: Int
    let cena: Int
}

public enum Zbrane {
    case zadna, dyka, tesak, kratkyMec, obusek, palcat, savle, sirokyMec, sekera, kyj, mecBastard, dlouhyMec, valecneKladivo, remdih, hulOkovana, dveDyky, vidle, kopi, valecnaSekera, sudlice, pika, tesakADyka, kratkyMecADyka, cep, halapartna, obourucniMec, tezkyKyj, trojzubec, dveSavle, sirokyMecADyka, sirokyMecATesak

    var popis: Zbran {
        switch self {
        case .zadna: 
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "žádná", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .dyka:
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "dýka", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .tesak:
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "tesák", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .kratkyMec:
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "krátký meč", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .obusek: 
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "obušek", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .palcat:
        return VychoziZbran(typ: .lehke, drzeni: .jednorucni, jmeno: "palcát", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .savle: 
        return VychoziZbran(typ: .stredni, drzeni: .jednorucni, jmeno: "šavle", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .sirokyMec: 
        return VychoziZbran(typ: .stredni, drzeni: .jednorucni, jmeno: "široký meč", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .sekera:
        return VychoziZbran(typ: .stredni, drzeni: .jednorucni, jmeno: "sekera", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .kyj:
        return VychoziZbran(typ: .stredni, drzeni: .jednorucni, jmeno: "kyj", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .mecBastard: 
        return VychoziZbran(typ: .tezke, drzeni: .jednorucni, jmeno: "meč bastard", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .dlouhyMec: 
        return VychoziZbran(typ: .tezke, drzeni: .jednorucni, jmeno: "dlouhý meč", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .valecneKladivo: 
        return VychoziZbran(typ: .tezke, drzeni: .jednorucni, jmeno: "válečné kladivo", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .remdih: 
        return VychoziZbran(typ: .tezke, drzeni: .jednorucni, jmeno: "řemdih", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .hulOkovana: 
        return VychoziZbran(typ: .lehke, drzeni: .obourucni, jmeno: "hůl okovaná", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .dveDyky: 
        return VychoziZbran(typ: .lehke, drzeni: .obourucni, jmeno: "dvě dýky", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .vidle: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "vidle", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .kopi: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "kopí", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .valecnaSekera: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "válečná sekera", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .sudlice: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "sudlice", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .pika: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "píka", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .tesakADyka:
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "tesák a dýka", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .kratkyMecADyka: 
        return VychoziZbran(typ: .stredni, drzeni: .obourucni, jmeno: "krátký meč a dýka", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .cep: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "cep", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .halapartna: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "halapartna", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .obourucniMec: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "obouruční meč", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .tezkyKyj: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "těžký kyj", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .trojzubec: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "trojzubec", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .dveSavle: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "dvě šavle", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .sirokyMecADyka: 
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "široký meč a dýka", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        case .sirokyMecATesak:
        return VychoziZbran(typ: .tezke, drzeni: .obourucni, jmeno: "široký meč a tesák", sila: 0, utocnost: 0, obrana: -3, vaha: 0, cena: 9)
        }
    }
}