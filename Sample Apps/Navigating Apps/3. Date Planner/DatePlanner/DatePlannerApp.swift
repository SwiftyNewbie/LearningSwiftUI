import SwiftUI

@main
struct DatePlannerApp: App {
    @StateObject private var eventData = EventData()

    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                EventList()
            } detail: {
                Text("Select an Event")
                    .foregroundStyle(.secondary)
            }
            .environmentObject(eventData)
        }
    }
}
