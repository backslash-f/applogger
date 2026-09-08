import Foundation

extension TimeInterval {
    /// Formats a duration for concise logging output.
    public nonisolated func formattedLogDuration() -> String {
        guard isFinite else {
            return "0s"
        }

        // Leave headroom because Double(Int.max) rounds to an out-of-range value.
        let maxRepresentableSeconds = Double(Int.max) - 1024
        let clampedSeconds = Int(min(max(0, rounded()), maxRepresentableSeconds))
        let hours = clampedSeconds / 3600
        let minutes = (clampedSeconds % 3600) / 60
        let seconds = clampedSeconds % 60

        if hours > 0 {
            if minutes > 0 {
                return "\(hours)h\(minutes)m"
            }
            return "\(hours)h"
        }

        if minutes > 0 {
            if seconds > 0 {
                return "\(minutes)m\(seconds)s"
            }
            return "\(minutes)m"
        }

        return "\(seconds)s"
    }
}
