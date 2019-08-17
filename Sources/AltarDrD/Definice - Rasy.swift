// Soubor čerpá z
// PPZ-PH:23-24
// PPZ-PH:68

/*
    Komentář:
    Rodové zbraně jako String není ideální řešení. Bylo by lepší zvolit jiné
    ale v současné situaci postačí...
*/

public protocol Hobit: AtributVelikost, AtributRodovaZbran {
}

public extension Hobit {
    var velikost: TridaVelikosti { 
        return .A
    }

    var rodoveZbrane: Set<String> { 
        return ["lehká kuše"]
    }   
}

public protocol Trpaslik: AtributVelikost, AtributRodovaZbran {
}

public extension Trpaslik {
    var velikost: TridaVelikosti { 
        return .A
    }

    var rodoveZbrane: Set<String> { 
        return ["válečná sekera"]
    }   
}

public protocol Kuduk: AtributVelikost, AtributRodovaZbran {
}

public extension Kuduk {
    var velikost: TridaVelikosti { 
        return .A
    }

    var rodoveZbrane: Set<String> { 
        return ["sekera"]
    }   
}

public protocol Elf: AtributVelikost, AtributRodovaZbran {
}

public extension Elf {
    var velikost: TridaVelikosti { 
        return .B
    }

    var rodoveZbrane: Set<String> { 
        return ["dlouhý luk"]
    }   
}

public protocol Clovek: AtributVelikost, AtributRodovaZbran {
}

public extension Clovek {
    var velikost: TridaVelikosti { 
        return .B
    }

    var rodoveZbrane: Set<String> { 
        return ["široký meč"]
    }   
}

public protocol Barbar: AtributVelikost, AtributRodovaZbran {
}

public extension Barbar {
    var velikost: TridaVelikosti { 
        return .B
    }

    var rodoveZbrane: Set<String> { 
        return ["meč bastard"]
    }   
}

public protocol Kroll: AtributVelikost, AtributRodovaZbran {
}

public extension Kroll {
    var velikost: TridaVelikosti { 
        return .C
    }

    var rodoveZbrane: Set<String> { 
        return ["těžký kyj"]
    }   
}
