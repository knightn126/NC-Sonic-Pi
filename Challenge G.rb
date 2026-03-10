use_bpm 160
use_synth :saw

notes = [:c2, :e2, :g2, :b2, :c3, :b2, :g2, :e2]


define :play_sequence do |notes, time = 0.5|
  i = 0                          
  while i < notes.length do      
    play notes[i]                
    sleep time
    i = i + 1                    
  end
end

loop_count = 0                   

live_loop :main_theme do
  with_fx :distortion do
    if loop_count >= 4            
      stop
    end
    play_sequence notes
    loop_count = loop_count + 1
  end
end

sleep 16


use_bpm 120
use_synth :fm
use_synth_defaults sustain: 0.25

sound  = [:e3, :e3, :g3, :e3, :r,  :d3, :c3, :b2]
timing = [1.5, 0.5, 0.75, 0.25, 0.5, 0.5, 2.0, 2.0]


define :play_timed_sequence do |notes, timings|
  i = 0
  while i < notes.length do     
    play notes[i]               
    sleep timings[i]            
    i = i + 1
  end
end

live_loop :white_stripes do
  play_timed_sequence sound, timing
end
