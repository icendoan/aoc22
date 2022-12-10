cmd‿arg ← <˘⍉> 4 (↑⋈(•BQN⎊0)∘(1⊸+⊸↓))¨ •file.Lines "10.input"
reg ← 1 +` arg
lengths ← 2‿1 ⊏˜ ⟨"addx", "noop"⟩ ⊐ cmd
states ← 1 » (+` (1+↕240) ∊ +` lengths) ⊏ 1 ∾ reg # state at the start of each cycle (IO 1)
samples ← (↕∘⌈)⌾(÷⟜40)⌾(-⟜20) +´ lengths
p1 ← +´ samples (⊣×⊏) 1∾states
pixels ← > 6 ⥊ <↕40
p2 ← " █" ⊏˜ 1 ≥ | pixels - 6‿40 ⥊ states
p1‿p2
