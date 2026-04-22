use_bpm 120

define :noise do
  sample "C:/Users/nathaniel_castillo/Downloads/noise.wav"
end
define :talk do
  sample "C:/Users/nathaniel_castillo/Downloads/talk.wav"
end

set :stop_background, false
set :stop_bass, false
set :stop_lead, false
set :stop_all, false

live_loop :background do
  stop if get(:stop_background)
  noise
  sleep 16
end

live_loop :snare do
  stop if get(:stop_all)
  sleep 13 if tick == 0
  with_fx :level, amp: 0.25 do
    sample :sn_dolf
    sleep 2
    sample :sn_dolf
    sleep 2
  end
end

live_loop :kick do
  stop if get(:stop_all)
  sleep 29 if tick == 0
  with_fx :level, amp: 0.25 do
    sample :hat_bdu
    sleep 1
    sample :hat_bdu
    sleep 0.5
    sample :hat_bdu
    sleep 0.5
    sample :hat_bdu
    sleep 1
  end
end

live_loop :chords do
  stop if get(:stop_all)
  sleep 45 if tick == 0
  set :stop_background, true
  play [:c3, :e3, :g3, :b3], sustain: 1
  sleep 4
  play [:c3, :e3, :g3, :b3], sustain: 1
  sleep 4
  play [:f3, :a3, :c4, :e4], sustain: 1
  sleep 4
  play [:f3, :a3, :c4, :e4], sustain: 1
  sleep 4
end

live_loop :bass do
  stop if get(:stop_bass)
  sleep 77 if tick == 0
  use_synth :bass_foundation
  with_fx :level, amp: 0.5 do
    play :g2, sustain: 6
    sleep 6
    play :b2, sustain: 1.5
    sleep 1
    play :a2, sustain: 6
    sleep 6
    play :b2, sustain: 0.5
    sleep 0.5
    play :a2, sustain: 0.5
    sleep 0.5
    play :g2, sustain: 1.5
    sleep 2
  end
end

live_loop :lead do
  stop if get(:stop_lead)
  sleep 93 if tick == 0
  use_synth :hollow
  notes = [:c6, :b6, :a6, :d6, :e6, :d6, :f6, :g6, :c6, :e6, :d6, :f6, :d6, :g6, :e6, :d6, :c6, :d6, :c6, :a6]
  durs  = [5,   1,   1,   6,   2,   4,   4,   4,   1,   4,   1,   4,   1,   4,   1,   1,   6,   4,   2,   2  ]
  notes.zip(durs).each do |note, dur|
    with_fx :level, amp: 2 do
      play note, sustain: dur
    end
    sleep dur
  end
  set :stop_bass, true
  set :stop_lead, true
end

in_thread do
  sleep 151
  
  
  talk
  sleep 52
  
  with_fx :level, amp: 1 do |fx|
    control fx, amp: 0, amp_slide: 8
    sleep 8
  end
  set :stop_all, true
end
