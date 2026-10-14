#include "../bench/calibration.hpp"
#include <gtest/gtest.h>
#include <vector>

using vquery::bench::repetitions_per_sample;

TEST(Benchmark, CalibrationUsesMedianAndRoundsUp) {
  struct Case {
    std::vector<std::uint64_t> warmups;
    std::size_t expected;
  };
  for (auto test : {Case{{}, 1}, Case{{10'000'000}, 1}, Case{{9'999'999}, 11},
                    Case{{1'000'000, 9'000'000, 2'000'000}, 50}, Case{{1'000'000, 3'000'000}, 50},
                    Case{{10'000}, 10000}, Case{{UINT64_MAX, UINT64_MAX}, 1}})
    EXPECT_EQ(repetitions_per_sample(test.warmups), test.expected);
}

TEST(Benchmark, CalibrationRejectsUnmeasurableOrExcessiveRepetition) {
  for (auto ns : {0u, 1u, 9999u}) {
    std::vector<std::uint64_t> warmups{ns};
    EXPECT_THROW(repetitions_per_sample(warmups), vquery::Error);
  }
}
