cmd‿arg ← <˘⍉> 4 (↑⋈(•BQN⎊0)∘(1⊸+⊸↓))¨ •file.Lines "10.input"
lengths ← 2‿1 ⊏˜ ⟨"addx", "noop"⟩ ⊐ cmd
states ← lengths / 1 » 1 +` arg
p1 ← +´ ((↕∘⌈)⌾(÷⟜40)⌾(-⟜20) +´ lengths) (⊣×⊏) 1∾states
p2 ← " █" ⊏˜ 1 ≥ | (>6⥊<↕40) - 6‿40 ⥊ states
p1‿p2
