use_bpm 188

note1 = [:c1, :d1, :e1, :f1, :g1, :a1, :b1]
note2 = [:c2, :d2, :e2, :f2, :g2, :a2, :b2]
note3 = [:c3, :d3, :e3, :f3, :g3, :a3, :b3]
note4 = [:c4, :d4, :e4, :f4, :g4, :a4, :b4]
note5 = [:c5, :d5, :e5, :f5, :g5, :a5, :b5]
note6 = [:c6, :d6, :e6, :f6, :g6, :a6, :b6]

sharp1 = [:cs1, :ds1, :fs1, :gs1, :as1]
sharp2 = [:cs2, :ds2, :fs2, :gs2, :as2]
sharp3 = [:cs3, :ds3, :fs3, :gs3, :as3]
sharp4 = [:cs4, :ds4, :fs4, :gs4, :as4]
sharp5 = [:cs5, :ds5, :fs5, :gs5, :as5]
sharp6 = [:cs6, :ds6, :fs6, :gs6, :as6]

sldr = [0.125, 0.25, 0.375, 0.5, 0.75,  1.0, 1.25, 1.5, 2.0, 2.5, 3.0, 3.5]

amplvl = [0, 1, 1.5]

define :p1  do |i, b|; play note1[i];  sleep sldr[b]; end
define :p2  do |i, b|; play note2[i];  sleep sldr[b]; end
define :p3  do |i, b|; play note3[i];  sleep sldr[b]; end
define :p4  do |i, b|; play note4[i];  sleep sldr[b]; end
define :p5  do |i, b|; play note5[i];  sleep sldr[b]; end
define :p6  do |i, b|; play note6[i];  sleep sldr[b]; end
define :p1s do |i, b|; play sharp1[i]; sleep sldr[b]; end
define :p2s do |i, b|; play sharp2[i]; sleep sldr[b]; end
define :p3s do |i, b|; play sharp3[i]; sleep sldr[b]; end
define :p4s do |i, b|; play sharp4[i]; sleep sldr[b]; end
define :p5s do |i, b|; play sharp5[i]; sleep sldr[b]; end
define :p6s do |i, b|; play sharp6[i]; sleep sldr[b]; end
define :pc  do |chord, b|; play chord; sleep sldr[b]; end

danVocals = "C:/Users/nathaniel_castillo/Downloads/DanDaDanVocals.mp3"
kuraVocals = "C:/Users/nathaniel_castillo/Downloads/krkrvocals.mp3"



define :danLead do
  use_synth :tech_saws
  p5  5, 5
  p5s 4, 5
  p5  5, 5
  p5  4, 5
  p5  2, 7
  p5  4, 7
  p5s 2, 7
  p5  2, 7
  p5s 1, 5
  p5s 1, 5
  p5  2, 7
  p5  4, 7
  p5  5, 7
  p5  4, 11
  
  p5  5, 5
  p5  5, 3
  p5  5, 5
  p5  4, 5
  p5  5, 5
  p5  6, 7
  p5  5, 5
  p5  4, 5
  p5  5, 5
  p5  5, 3
  p5  5, 5
  p5  4, 5
  p5  5, 5
  p5  6, 7
  
  p5  1, 3
  p5  1, 3
  p5  1, 3
  p5  1, 3
  
  pc  [:c5, :e5], 7
  p5  4, 7
  p5s 2, 7
  p5  2, 5
  p5s 1, 5
  p5s 1, 5
  pc  [:b5, :e5], 7
  p5  4, 7
  p5  5, 5
  p5  4, 10
  
  pc  [:e5, :b6], 7
  pc  [:fs5, :a6],7
  pc  [:g5, :c6], 7
  p6  6, 5
  p6  6, 4
  p6  5, 4
  p5  4, 4
  p5  4, 3
  
  pc  [:g3, :b3, :e4], 5
  p4  2, 3
  pc  [:b3, :e4, :g4], 3
  pc  [:b3, :e4, :g4], 3
  pc  [:g3, :b3, :e4], 3
  sleep sldr[3]
  pc  [:a3, :b3, :ds4, :fs4], 3
  pc  [:a3, :b3, :ds4, :fs4], 3
  p3  5, 3
  pc  [:ds4, :fs4], 3
  p3  5, 3
  pc  [:a3, :ds4, :fs4], 3
  pc  [:a3, :ds4, :fs4], 3
  sleep sldr[5]
  pc  [:b3, :d4, :g4], 5
  pc  [:d4, :g4, :b4], 3
  p3  6, 3
  pc  [:d4, :g4, :b4], 3
  p3  6, 3
  sleep sldr[3]
  pc  [:a3, :g3, :cs4], 3
  pc  [:a3, :g3, :cs4], 3
  p4s 0, 3
  pc  [:a3, :cs4, :g4], 5
  pc  [:e3, :g3, :c4], 5
  sleep sldr[3]
  pc  [:fs3, :a3, :d4], 3
  pc  [:fs3, :a3, :d4], 3
  sleep sldr[3]
  pc  [:g3, :b3, :e4], 5
  sleep sldr[3]
  pc  [:g3, :c4, :e4, :g4], 7
  pc  [:g3, :c4, :e4, :g4], 5
  pc  [:g3, :c4, :e4, :g4], 5
  
  with_fx :level, amp: 1 do |kura_vol|
    in_thread { kuraLead }
    in_thread { kuraBass }
    in_thread do
      sleep 19.5
      sample kuraVocals
    end
    
    
    sleep 70
    control kura_vol, amp: 0, amp_slide: 10
    sleep 10
  end
  
  stop
  
end

define :danBass do
  
  use_synth :tri
  
  sleep sldr[11]
  
  p3  0, 3
  pc  [:b3, :g3, :e3, :c3],  5
  p3  0, 3
  p3  0, 5
  p3  0, 3
  p3  0, 3
  
  pc  [:b2, :ds3, :fs3, :a3], 5
  p2  6, 3
  p2  6, 3
  p2  6, 3
  pc  [:b2, :ds3, :fs3, :a3], 5
  pc  [:b2, :ds3, :fs3, :b3], 5
  
  pc  [:e3, :g3, :b3, :d4],   5
  p3  2, 3
  p3  2, 5
  p3  2, 3
  p3  2, 3
  
  pc  [:g2, :b2, :d3, :f3],   3
  pc  [:g2, :b2, :d3, :f3],   3
  p2  4, 3
  p2  4, 3
  p2  4, 5
  p2  4, 3
  p2  5, 3
  p2  6, 3
  
  pc  [:c3, :e3, :g3, :b3],   5
  p3  0, 3
  p3  0, 3
  sleep sldr[3]
  p3  0, 3
  p3  0, 3
  
  pc  [:d3, :fs3, :a3, :c4], 3
  pc  [:d3, :fs3, :a3, :c4], 3
  p3  1, 3
  p3  1, 3
  p3  1, 5
  pc  [:ds3, :fs3, :a3, :c4], 7
  pc  [:e3, :g3, :b3, :d4], 3
  sleep sldr[5]
  
  pc  [:cs3, :fs3, :as4, :ds4], 5
  p3s 1, 3
  p3s 1, 3
  pc  [:d3, :f3, :a3, :c4], 3
  pc  [:d3, :f3, :a3, :c4], 5
  pc  [:e3, :g3, :b3, :cs4], 5
  pc  [:e3, :g3, :b3, :cs4], 3
  pc  [:g2, :f3], 5
  
  p2  0, 5
  p3  0, 5
  p3  0, 3
  p2  0, 3
  p3  0, 3
  p1  6, 3
  p1  6, 3
  p1  6, 3
  p2  6, 5
  p2  6, 3
  p1  6, 3
  p2s 0, 3
  p2s 1, 3
  p2  2, 5
  
  p3  2, 3
  p3  2, 3
  p2  2, 3
  p3  2, 3
  
  p1  5, 3
  p1  5, 3
  p2  5, 3
  p3  2, 3
  p3  4, 3
  p3  5, 3
  p4s 0, 3
  p4  2, 3
  
  pc  [:a3, :e4, :g4], 7
  pc  [:b3, :fs4, :a4], 7
  pc  [:c4, :g4], 7
  play note4[1]; sleep 0.1
  play note4[4]; sleep 0.1
  play note5[0]; sleep 0.1
  sleep sldr[8]
  
  pc  [:c3, :c2], 5
  p2  0, 3
  p3  0, 5
  pc  [:d3, :d2], 3
  pc  [:c3, :c2], 3
  pc  [:b3, :b2], 3
  pc  [:b3, :b2], 3
  p2  6, 3
  p3  6, 3
  p2  6, 3
  p2  6, 3
  p2  6, 3
  pc  [:d3, :d2], 3
  pc  [sharp3[1], sharp2[1]], 3
  pc  [:e3, :e2], 5
  p3  2, 3
  p2  2, 3
  p2  2, 3
  
  pc  [:b3, :b2], 3
  pc  [sharp3[4], sharp2[4]], 3
  pc  [:a3, :a2], 3
  pc  [:a3, :a2], 3
  p2  5, 3
  p3  5, 3
  p2  5, 3
  p2  5, 3
  p2  5, 3
  p3  5, 3
  p3  6, 3
  pc  [:a3, :a2], 5
  p2  6, 3
  pc  [:b3, :b2], 3
  pc  [:b3, :b2], 3
  p2  0, 3
  pc  [:c2, :c3], 5
  p2  1, 3
  pc  [:d3, :d2], 5
  p2  1, 3
  p2  1, 3
  p2  1, 7
  
  stop
  
end

define :kuraLead do
  use_synth :piano
  sleep sldr[5]
  p4 0, 1
  p4 1, 1
  p4s 1, 1
  p4 2, 1
  pc [:a3,:c4,:f4], 5
  sleep sldr[3]
  pc [:b3,:d4,:g4], 5
  pc [:e5,:g5,:e6], 3
  pc [:f5,:a5,:f6], 3
  pc [:g5,:b5,:g5], 3
  sleep sldr[5]
  pc [:a5,:e6,:gs6,:d6], 5
  4.times do
    play note6[5], amp: amplvl[1]; sleep sldr[3]
    play note5[5], amp: amplvl[1]; sleep sldr[3]
  end
  8.times do
    play note6[5], amp: amplvl[1]; sleep sldr[1]
    play note5[5], amp: amplvl[1]; sleep sldr[1]
  end
  p6 0, 8
  p4 4, 5
  sleep sldr[5]
  pc [:c3,:g3,:b3,:e4], 3
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 5
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 3
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 5
  p4 1, 3
  pc [:c3,:g3,:b3,:e4], 3
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 5
  sleep sldr[5]
  pc [:d3,:gs3,:c4,:f4], 3
  sleep sldr[3]
  pc [:d3,:gs3,:c4,:f4], 5
  sleep sldr[3]
  pc [:d3,:gs3,:c4,:f4], 3
  sleep sldr[3]
  3.times { pc [:d3,:g3,:c4,:f4], 3 }
  pc [:d3,:g3,:c4,:g4], 3
  sleep sldr[3]
  pc [:d3,:g3,:c4,:f4], 5
  sleep sldr[5]
  pc [:c3,:g3,:b3,:e4], 3
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 5
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 3
  sleep sldr[3]
  pc [:c3,:g3,:b3,:e4], 5
  p4 1, 3
  pc [:c3,:g3,:b3,:e4], 3
  pc [:c3,:g3,:b3,:e4], 3
  pc [:c3,:g3,:b3,:e4], 5
  sleep sldr[5]
  pc [:d3,:gs3,:c4,:f4], 3
  sleep sldr[3]
  pc [:d3,:gs3,:c4,:f4], 5
  sleep sldr[3]
  pc [:d3,:gs3,:c4,:f4], 3
  sleep sldr[3]
  3.times do
    pc [:d3,:gs3,:c4,:f4], 3
    sleep sldr[3]
  end
  pc [:gs3,:d4,:f4,:d5], 3
  pc [:e4,:g4,:c5,:e5], 5
  pc [:g4,:c5,:e5], 3
  pc [:g4,:c5,:e5], 5
  p5 1, 3
  p5 0, 3
  pc [:d5,:g5], 3
  p5 2, 3
  sleep sldr[3]
  pc [:g4,:c5], 3
  sleep sldr[3]
  p5 0, 3
  p5 1, 3
  p5 2, 3
  pc [:a4,:d5,:f5], 3
  p5s 1, 3
  p5 3, 3
  p5 2, 3
  pc [:a4,:d5,:g5], 3
  p5s 2, 3
  p5 3, 3
  pc [:a4,:e5,:d5], 5
  p5s 0, 3
  p5 1, 5
  pc [:gs4,:f4,:c5], 3
  sleep sldr[3]
  pc [:gs4,:f4,:c5], 3
  pc [:e4,:g4,:b4], 5
  pc [:g4,:c5,:e5], 3
  sleep sldr[3]
  pc [:g4,:c5,:e5], 5
  p5 1, 3
  p5 0, 3
  pc [:g4,:d5], 3
  p5 2, 3
  sleep sldr[3]
  pc [:g4,:c5], 3
  sleep sldr[3]
  p5 0, 3
  p5 1, 3
  p5 2, 3
  pc [:a4,:d5,:f5], 3
  p5s 1, 3
  p5 3, 3
  p5 2, 3
  pc [:a4,:d5,:g5], 3
  sleep sldr[3]
  pc [:a4,:d5,:f5], 5
  stop
end

define :kuraBass do
  use_synth :tri
  use_synth_defaults amp: 2
  pc [:a2,:a3], 5
  p2 5, 3
  p3 5, 3
  pc [:d1,:d2], 5
  p1s 1, 3
  pc [:e1,:e2], 5
  p1 6, 3
  p2 2, 3
  p2 3, 3
  sleep sldr[3]
  p1 5, 3
  play [:b2,:as3], sustain: 3, amp: amplvl[2]; sleep sldr[10]
  pc [:b2,:as3], 5
  pc [:b2,:as3], 5
  p2 6, 5
  pc [:d3,:f3,:gs3], 7
  sleep 4.5
  p1 5, 5
  sleep sldr[4]
  p2 5, 1
  p2 2, 3
  p2 4, 3
  p1 5, 3
  sleep sldr[3]
  p1 5, 5
  p2 5, 3
  p2 2, 3
  p2 4, 3
  p2 4, 3
  p2 5, 3
  p1 5, 3
  p1s 4, 5
  sleep sldr[4]
  p2s 4, 1
  p2 3, 3
  p2s 3, 3
  p1s 4, 3
  sleep sldr[3]
  p1s 4, 5
  sleep sldr[3]
  p2 3, 3
  p3 0, 3
  p2s 4, 3
  p2s 3, 3
  p2 3, 3
  p1 5, 5
  sleep sldr[4]
  p2 5, 1
  p2 2, 3
  p2 4, 3
  p1 5, 3
  sleep sldr[3]
  p1 5, 5
  p2 5, 3
  p2 2, 3
  p2 4, 3
  sleep sldr[3]
  p2 5, 3
  p1 5, 3
  p1s 4, 5
  sleep sldr[4]
  p2s 4, 1
  p2 3, 3
  p2s 3, 3
  p2s 4, 3
  sleep sldr[3]
  p1s 4, 3
  sleep sldr[3]
  pc [:as1,:as2], 3
  sleep sldr[3]
  pc [:as1,:as2], 3
  sleep sldr[3]
  pc [:as1,:as2], 5
  p1 5, 5
  sleep sldr[3]
  p2 2, 3
  p2 4, 3
  p2 5, 3
  sleep sldr[3]
  p1 5, 3
  sleep sldr[3]
  p1 5, 3
  p2 5, 3
  p2 2, 3
  p2 4, 3
  p2 5, 3
  sleep sldr[3]
  p1 5, 3
  p1s 4, 5
  sleep sldr[3]
  p2 3, 3
  p2s 3, 3
  p2s 4, 3
  sleep sldr[3]
  p1s 4, 3
  sleep sldr[3]
  p1s 4, 3
  p2s 4, 3
  p2 3, 3
  p2s 3, 3
  p2s 4, 3
  sleep sldr[3]
  p1s 4, 3
  p1 5, 5
  sleep sldr[3]
  p2 2, 3
  p2 4, 3
  p2 5, 3
  sleep sldr[3]
  p1 5, 3
  p1s 4, 5
  sleep sldr[3]
  p2 3, 3
  p2s 3, 3
  p2s 4, 3
  sleep sldr[3]
  p1s 4, 3
  
  stop
  
end

in_thread do
  
  danLead
  
end

in_thread do
  
  sleep 50
  
  sample danVocals
  
end

in_thread do
  
  danBass
  
end
