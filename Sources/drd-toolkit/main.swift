import RPGSpolecne

/*
 Na krátkém příkladu si demonstrujeme jak lze zkonstruovat mechaniku. Cíl je, abychom byli schopni sledovat mechaniku "zevnitř" a upravovat její hodnoty. Toto implementovat pomocí imperativního kódu by byl nelehký úkol. Pomůžeme se tedy novou konstrukcí Swiftu, která se nazývá "Function Builders"
 Function builders je blok, který obsahuje deklarace jednotlivých elementů a pomocí statických metod z nich udělá výstup odpovídající typu svého výstupu. Viz RPGSpolecne - Mechanika.swift.
 
 Mechanika kterou budeme implementovat je vymyšlená. Mohli bychom ji popsat takto:
 -Postava má zbraně
 -Zbraně mají velikost útoku.
 -Zbraně mají útok na blízko a na dálku
 -Zbraně na dálku mají i útok na blízko, zbraně na blízko nemají útok na dálku.
 -Postava chce útočit.
 -Mechanika útoku je níže.
 -Postava má zdraví a maximální zdraví.
 
 Mechanika útoku:
    * Hod na útok 1k6
    * Přičti sílu zbraně
        * Vyber zbraň s největším útokem pro daný druh souboje
        * Pokud nemáš zbraň odečti 3
    * Přičti postih nebo bonus za zdraví
        * Pokud máš víc jak 10 maximálního zdraví přičti podíl 10 (zaokrouhleno dolů)
        * Pokud máš méně jak 1/3 maxímálního zdraví, odečti 3
    * Součet nemůže být menší než 0
 */

//Nejprve si deklarujeme typy
protocol Zbran {
    var utokNaBlizko: Int { get }
}
protocol ZbranNaBlizko: Zbran { }
protocol ZbranNaDalku: Zbran {
    var utokNaDalku: Int { get }
}

enum TypSouboje: String {
    case naBlizko, naDalku
}

//Deklarujeme si konkrétní typy
struct Mec: ZbranNaBlizko {
    let jmeno: String // nepodstatná proměnná
    let utokNaBlizko: Int
}

struct Svihadlo: ZbranNaDalku {
    let utokNaDalku: Int
    let utokNaBlizko: Int
}

struct Hrac {
    let zbrane: [Zbran]
    let maximalniZdravi: Int
    let soucasneZdravi: Int
}

//Nyni se deklarujeme mechaniku

@Mechanika
func ziskejUtok(hrace hrac: Hrac, typSouboje: TypSouboje) -> Krok<Int> {
    Krok.sPodkorky("Sečteme a opravíme výsledek", reduce: { max(0, $0.reduce(0, +)) }) {
        Krok("Hoď 1k6") { Int.random(in: 1...6) }
        Krok("Získejme útočené číslo zbraně (vyber zbraň s největším útokem pro souboj typu \(typSouboje.rawValue). Pokud nemáš zbraň počítej -3") {
            var utok: Int? = nil
            switch typSouboje {
            case .naBlizko:
                utok = hrac.zbrane.max { $0.utokNaBlizko < $1.utokNaBlizko }?.utokNaBlizko
            case .naDalku:
                utok = hrac.zbrane.flatMap { $0 as? ZbranNaDalku }.max { $0.utokNaDalku < $1.utokNaDalku }?.utokNaDalku
            }
            return utok ?? -3
        }
        Krok.sPodkorky("Přičti bonusy za zdraví", reduce: { max(0, $0.reduce(0, +)) }) {
            Krok("Pokud máš víc jak 10 maximálního zdraví přičti podíl 10 (zaokrouhleno dolů)") {
                return hrac.maximalniZdravi / 10
            }
            Krok("Pokud máš méně jak 1/3 maxímálního zdraví, odečti 3") {
                return hrac.maximalniZdravi/3 > hrac.soucasneZdravi ? -3 : 0
            }
        }
    }
}

// Nyní si představme že hrajeme a chceme vytvořit mechaniku pro daného hráče

let zbraneNaBlizko: [ZbranNaBlizko] = [
    Mec(jmeno: "Petr", utokNaBlizko: 6),
    Mec(jmeno: "Matej", utokNaBlizko: 6),
    Mec(jmeno: "Miki", utokNaBlizko: 9000)
]

let zbraneNaDalku: [ZbranNaDalku] = [
    Svihadlo(utokNaDalku: 10, utokNaBlizko: 3),
    Svihadlo(utokNaDalku: 6, utokNaBlizko: 7)
]

let titaniusOcelkuj = Hrac(zbrane: zbraneNaDalku + zbraneNaBlizko, maximalniZdravi: 100, soucasneZdravi: 48)

// Vytvoříme si instanci mechaniky

let mechanika = ziskejUtok(hrace: titaniusOcelkuj, typSouboje: .naBlizko)

// vykonej mechaniku tj. získej útočené číslo
let utocneCislo = mechanika.vykonej()
if utocneCislo < 9000 {
    print("Tvůj patetický útok je \(utocneCislo)")
} else {
    print("IT'S OVER 9000!!!! (\(utocneCislo))")
}

// Při opakovných startech si všimněte, že výsledek je pokaždé jiný. To kvůli tomu, že hod je "uvnitř" mechaniky a tedy se vykoná při každém refreshi znova.
