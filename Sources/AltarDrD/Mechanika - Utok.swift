import RPGSpolecne

public protocol Placeholder {}

public protocol SoubojTvariVTvar {

    typealias Utocnik = AtributRodovaZbran & 
                        AtributVelikost & 
                        AtributSila & 
                        SchopnyDrzetZbran 

    typealias Obrance = AtributVelikost

    static func utok(_ utocnik: Utocnik, obrance: Obrance) 
}

public extension SoubojTvariVTvar {

    // PPZ-PH:71-72
    static func poskozeniUtok(_ utocnik: Utocnik, hodNaUtok: Int, obrance: Obrance) -> Int {
        // Určení útočeného čísla
        var utocneCislo: Int = 0
        /// Zjisti bonus nebo postih za sílu
        let postihZaSilu = Tabulka.postihNeboBonus(proAtribut: utocnik.sila)
        /// Přičti sílu používané zbraně
        let silaZbrane = utocnik.drzenaZbran.sila
        /// Přičti bonus za rodovou zbraň
        let rodovaZbran = utocnik.rodoveZbrane.contains(utocnik.drzenaZbran.jmeno) ? 1 : 0

        utocneCislo = postihZaSilu + silaZbrane + rodovaZbran

        /// Účné číslo je nejméně nula
        utocneCislo = max(utocneCislo, 0)

        // Přičti hod kostkou
        utocneCislo += hodNaUtok

        // Opravení výsledku
        //let oprava
        /// Podle rozdílu velikostí
        let rozdilVelikosti = Tabulka.opravaPodleVelikosti(utocnik: utocnik.velikost, obrance: obrance.velikost)
        /// Podle počtu životů a odolnosti útořníka
        /// Odečti postih za naložení
        
        return (0)
    }

}