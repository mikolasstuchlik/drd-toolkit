import RPGSpolecne

//
@MechanicBuilder 
func createMechanic(obrana: Int, utok: Int, zdraviMax: Int, soucasneZdravi: Int) -> Krok<Void> {
    Krok<Void>.sPodkorky("Hlavni", reduce:  { _ in print("Hlavni") } ) { 
        Krok<Void>("a", operace: {print("a")})
        Krok<Void>("b", operace: {print("b")})
        Krok<Void>("c", operace: {print("c")})

        Krok<Void>.sPodkorky("mensi", reduce: { _ in print("mensi") } ) { 
            Krok<Void>("1", operace: {print("1")})
            Krok<Void>("2", operace: {print("2")})
            Krok<Void>("3", operace: {print("3")})
        
            Krok<Void>.sPodkorky("nejmensi", reduce:  { _ in print("nejmensi") } ) { 
                Krok<Void>("1a", operace: {print("1a")})
                Krok<Void>("2b", operace: {print("2b")})
                Krok<Void>("3c", operace: {print("3c")})
        
            }
        } 
    } 
}

let mechanika = createMechanic(obrana: 5, utok: 10, zdraviMax: 100, soucasneZdravi: 40)

print(mechanika.evaluate())
