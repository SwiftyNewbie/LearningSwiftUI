import SwiftUI

struct ForecastView: View {
    var body: some View {
        VStack {
            Text("Forecast")
                .font(.largeTitle)
            ScrollView(.horizontal) {
                HStack {
                    DayForecast(day: "Mon", isRainy: false, high: 70, low: 50)
                    DayForecast(day: "Tue", isRainy: true, high: 60, low: 40)
                    DayForecast(day: "Wed", isRainy: true, high: 55, low: 35)
                    DayForecast(day: "Thu", isRainy: true, high: 59, low: 31)
                    DayForecast(day: "Fri", isRainy: true, high: 53, low: 37)
                    DayForecast(day: "Sat", isRainy: true, high: 51, low: 32)
                    DayForecast(day: "Sun", isRainy: false, high: 65, low: 52)
                }
                .padding(8)
            }
            WeekForecast(avgHigh: 59, avgLow: 38, rainyDays: 5, sunnyDays: 2)
        }
    }
}

#Preview {
    ForecastView()
}

struct DayForecast: View {
    let day: String
    let isRainy: Bool
    let high: Int
    let low: Int

    var iconName: String {
        isRainy ? "cloud.drizzle.fill" : "sun.max.fill"
    }

    var iconColor: Color {
        isRainy ? .blue : .yellow
    }

    var tempHighColor: Color {
        switch high {
        case 60..<70:
            return .orange
        case ..<60:
            return .green
        default:
            return .red
        }
    }

    var body: some View {
        VStack {
            Text(day)
                .font(.title2)
            Image(systemName: iconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 46, height: 46)
                .foregroundStyle(iconColor)
                .padding(2)
            Text("High: \(high)º")
                .fontWeight(.regular)
                .foregroundStyle(tempHighColor)
            Text("Low: \(low)º")
                .fontWeight(.light)
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

struct WeekForecast: View {
    let avgHigh: Int
    let avgLow: Int
    let rainyDays: Int
    let sunnyDays: Int

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("Week Forecast")
                    .font(.largeTitle)
                    .padding(.bottom, 8)
                Spacer()
            }
            ExtractedView(title: "📈 Avg High:", value: avgHigh)
                .padding(.bottom, 4)
            ExtractedView(title: "📉 Avg Low:", value: avgLow)
                .padding(.bottom, 4)
            ExtractedView(title: "☔️ Rainy Days:", value: rainyDays)
                .padding(.bottom, 4)
            ExtractedView(title: "☀️ Sunny Days:", value: sunnyDays)
            Spacer()
        }
        .padding()
    }
}

struct ExtractedView: View {
    let title: String
    let value: Int
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text("\(value)º")
        }
        .font(.headline)
    }
}
