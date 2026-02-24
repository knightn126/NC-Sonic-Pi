# CHALLENGE D: Use functions to optimize the SpongeBob theme!

use_bpm 136
use_synth :piano

define :bg_pattern do |vol|
  play :E3, amp: vol; sleep 1
  play :B3, amp: vol
  play :E4, amp: vol; sleep 1
  play :B3, amp: vol; sleep 1
  play :E4, amp: vol; sleep 1
end

define :measure_A do
  play :r; sleep 1
  play :E5; play :Gs4; play :B4; sleep 1
  play :B4; sleep 1
  play :E5; play :Gs4; sleep 1
end

define :measure_B do
  play :E4; sleep 1
  play :E5; play :Gs4; sleep 2
  play :E5; play :Gs4; sleep 1
end

define :measure_C do
  play :B4; sleep 0.75
  play :As4; sleep 0.25
  play :Gs4; play :B4; sleep 0.75
  play :Cs5; sleep 0.25
  play :B4; sleep 1
  play :Gs4; play :E5; sleep 1
end

live_loop :background_notes do
  bg_pattern 0.25
  bg_pattern 0.5
  bg_pattern 0.75
  5.times do
    bg_pattern 1
  end
  stop
end

# Measure 1 
play :r; sleep 1
play :E4; play :Gs4; sleep 2
play :E5; play :Gs4; sleep 1

measure_B  # Measure 2
measure_A  # Measure 3
measure_A  # Measure 4
measure_C  # Measure 5
measure_A  # Measure 6
measure_C  # Measure 7
measure_B  # Measure 8