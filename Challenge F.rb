note = 20

use_synth :piano

88.times do
  play (note+1)
  note = note + 1
  sleep 0.1
end
