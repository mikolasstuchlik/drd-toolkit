# Template pro demonstraci navrhovaného stylu

## Build
Soubor Template.swift není zahrnut v Package souboru. Pro jeho build použijte přímo Swift kompilátor:
``` $ swiftc Template.swift ```

## Myšlenkový základ
Náš toolkit má za cíl spojit více pravidel do jednoho programu tak, aby si pán jeskyně (ten kdo vytváří pravidla) mohl vybrat mezi více mechanikami z více pravidel a nebyl pokud možno omezen. Za tímto účelem použijeme dekompozici silně orientovanou na protokoly. 

- Každý svět pravidel (DD, DrD, Fate atd.) bude mít svůj vlastní target.
- Zobecnitelné vlastnosti budou mít protokol v targetu `RPGCommons` (například životy, jméno atd.)
- Každá mechanika musí být generická.
- Implementace žádné části by neměla preferovat třídy.
- Jednotlivé mechaniky by neměly používat IO.
- Tabulky a lookup tabulky by měly být přístupné v enumu bez konstruktoru `Tabulky`
- Pokud implementace nepočítá s tím, že by vlastnost mohla mít záporné číselné vyjádření, je nutné použít Unsigned hodnotu.

Součastí toolkitu je target `RPGUI` které bude zajišťovat uživatelské rozhraní. Sestaveným pravidlům bude poskytovat pokud možno co nejlehčí přístup k tabulkám a formulářům.