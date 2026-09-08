import Foundation

extension Date {
    /// Formats the date as `dd/MM HH:mm:ss` for concise logging output.
    public nonisolated func formattedLogTimestamp(
        locale: Locale = .autoupdatingCurrent,
        timeZone: TimeZone = .autoupdatingCurrent
    ) -> String {
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timeZone
        formatter.dateFormat = "dd/MM HH:mm:ss"
        return formatter.string(from: self)
    }
}
