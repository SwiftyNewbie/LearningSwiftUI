import SwiftUI

struct Info {
    let image: String
    let name: String
    let story: String
    let hobbies: [String]
    let foods: [String]
    let colors: [Color]
    let funFacts: [String]
}

let information = Info(
    image: "AW2-medium",
    name: "Alan Wake",
    story: "A story is not a machine that does what you tell it. A story is a beast with a life of its own. You can create it, shape it, but as the story grows, it starts wanting things on its own. Change one thing, and you set off a chain reaction of events that spreads through the whole thing. The characters have to be true to themselves. The events need to follow a logic that fits the story. A single flaw and the magic is gone. The story dies.",
    hobbies: ["pencil", "flashlight.off.fill", "figure.run"],
    foods: ["🍕", "🍿", "☕️"],
    colors: [Color.black, Color.black, Color.black],
    funFacts: [
        "Unlike the first Alan Wake (2010), the Alan Wake 2 is rated M by ESRB. The first game was rated T.",
        "Unlike the first Alan Wake (2010), the Alan Wake 2 utilizes both CGI and live-action cutscenes throughout.",
        "Alan Wake 2 takes place thirteen (13) years after the first Alan Wake game.",
        "In Mr. Door's green room, there is a copy of a book written by Dr. Darling. This is a nod to Control, as Darling is the Head of Research at FBC.",
        "Rubber ducks can be found in many places throughout the game. In Control (2019) there is a mission involving a rubber duck that has become an Altered Item (a seemingly mundane item that has been given unpredictable and potentially dangerous \"paranatural\" powers).",
        "An Alan Wake (2010) sequel was planned shortly after its release, but was cancelled. Its story was reworked into Quantum Break (2016). However following the release of Control (2019), Remedy once again chose to develop a follow-up to Alan Wake by putting it in the same universe of Control.",
        "The janitor Ahti, who appeared in Remedy's game Control (2019), also appears in this game. Portrayed once again by Martti Suosalo.",
        "Remedy's first sequel in 20 years, following Max Payne 2: The Fall of Max Payne (2003).",
        "Detective Alex Casey strongly resembles Max Payne, another Remedy video game character. However, Remedy could not use his name in the game as the Max Payne IP is owned by Rockstar Games. Rockstar bought the property and distribution rights of the Max Payne series from Remedy Entertainment in 2003.",
        "Characters from Remedy's previous game Control (2019) appear throughout the game, as they both exist in the same established Remedy Connected Universe."
    ]
)
