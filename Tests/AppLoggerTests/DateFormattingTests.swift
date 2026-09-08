import Foundation
import Testing

@testable import AppLogger

/// Verifies log-friendly timestamp formatting.
@Suite struct DateFormattingTests {
    @Test
    func formatsDateAsDayMonthAndTime() {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(
            calendar: calendar, timeZone: TimeZone(secondsFromGMT: 0), year: 2026, month: 5, day: 12, hour: 21,
            minute: 15, second: 4)
        let date = components.date ?? .distantPast

        #expect(
            date.formattedLogTimestamp(
                locale: Locale(identifier: "en_GB"), timeZone: TimeZone(secondsFromGMT: 0) ?? .autoupdatingCurrent)
                == "12/05 21:15:04")
    }

    @Test
    func preservesDayMonthOrderForMonthFirstLocales() {
        let date = Date(timeIntervalSince1970: 1_778_620_504)

        #expect(
            date.formattedLogTimestamp(
                locale: Locale(identifier: "en_US"), timeZone: TimeZone(secondsFromGMT: 0) ?? .autoupdatingCurrent)
                == "12/05 21:15:04")
    }
}
