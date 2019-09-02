struct VýchozíRasa: AtributRasa {
    let nazev: String  
    let velikost: TridaVelikosti
    let vrozenaSchopnost: [Schopnost]
    let rodoveZbrane: Set<String> 
}

// PPZ-PH:23-24
// PPZ-PH:68
public enum Rasy {
    case hobit, trpaslik, kuduk, elf, clovek, barbar, kroll
/*
    var popis: AtributRasa {
        switch self{
        case .hobit:
            return VýchozíRasa(nazev: "hobit", velikost: .A, vrozenaSchopnost: [], rodoveZbrane: [])
        case .trpaslik:
            return VýchozíRasa(nazev: "trpaslík", velikost: .A, vrozenaSchopnost: [], rodoveZbrane: [Zbrane.valecnaSekera.popis.jmeno])
        case .kuduk:
            return VýchozíRasa(nazev: "kudůk", velikost: .A, vrozenaSchopnost: [], rodoveZbrane: [Zbrane.sekera.popis.jmeno])
        case .elf:
            return VýchozíRasa(nazev: "elf", velikost: .B, vrozenaSchopnost: [], rodoveZbrane: [])
        case .clovek:
            return VýchozíRasa(nazev: "člověk", velikost: .B, vrozenaSchopnost: [], rodoveZbrane: [Zbrane.sirokyMec.popis.jmeno])
        case .barbar:
            return VýchozíRasa(nazev: "barbar", velikost: .B, vrozenaSchopnost: [], rodoveZbrane: [Zbrane.mecBastard.popis.jmeno])
        case .kroll:
            return VýchozíRasa(nazev: "kroll", velikost: .C, vrozenaSchopnost: [], rodoveZbrane: [Zbrane.tezkyKyj.popis.jmeno])
        }
    }
*/
}

