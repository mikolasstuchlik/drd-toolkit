// PPZ-PH:23-24
public protocol AtributRasa: AtributVelikost, AtributRodovaZbran {
    var nazev: String { get }
    var vrozenaSchopnost: [Schopnost] { get }
}

// PPZ-PH:68
public protocol AtributRodovaZbran {
    var rodoveZbrane: Set<String> { get }
}
