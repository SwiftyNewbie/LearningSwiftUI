import SwiftData

@Model class Item {
    var name: String
    var checked: Bool

    init(name: String, checked: Bool) {
        self.name = name
        self.checked = checked
    }
}
