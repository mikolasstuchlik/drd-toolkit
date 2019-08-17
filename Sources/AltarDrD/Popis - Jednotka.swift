import RPGSpolecne

// PPZ-PH:23
public enum TridaVelikosti {
    case A0, A, B, C, D, E
}

public extension Tabulka {

    // PPZ-PH:71
    static func opravaPodleVelikosti(utocnik: TridaVelikosti, obrance: TridaVelikosti) -> Int {
        let tabuka: [TridaVelikosti:[TridaVelikosti: Int]] = [
            .A0: [.A0:0,    .A:2,   .B:3,   .C:4,   .D:0,   .E:-2],
            .A:  [.A0:-2,   .A:0,   .B:1,   .C:2,   .D:0,   .E:-1],
            .B:  [.A0:-3,   .A:-1,  .B:0,   .C:1,   .D:2,   .E:0],
            .C:  [.A0:-4,   .A:-2,  .B:-1,  .C:0,   .D:1,   .E:2],
            .D:  [.A0:-5,   .A:-3,  .B:-2,  .C:-1,  .D:0,   .E:1],
            .E:  [.A0:-7,   .A:-4,  .B:-3,  .C:-2,  .D:-1,  .E:0],
        ]

        return tabuka[obrance]?[utocnik] ?? 0
    }
}
