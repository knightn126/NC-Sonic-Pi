use_bpm 160
use_synth :saw

notes = [:c2, :e2, :g2, :b2, :c3, :b2, :g2, :e2]

define :play_sequence do |notes, time = 0.5|
  notes.each do |note|
    play note
    sleep time
  end
end

live_loop :main_theme do
  with_fx :distortion do
    stop if tick == 4
    play_sequence notes
  end
end

sleep 16

use_bpm 120
use_synth :fm
use_synth_defaults sustain: 0.25

sound  = [:e3, :e3, :g3, :e3, :r,  :d3, :c3, :b2]
timing = [1.5, 0.5, 0.75, 0.25, 0.5, 0.5, 2.0, 2.0]

define :play_timed_sequence do |notes, timings|
  notes.zip(timings).each do |note, duration|
    play note
    sleep duration
  end
end

live_loop :white_stripes do
  play_timed_sequence sound, timing
end
