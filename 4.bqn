⟨Int⟩ ← •Import "util.bqn"
ranges ← <˘⍉> Int⚇¯2 (⊢-˜¬×+`)∘(∊⟜",-")⊸⊔¨ •file.Lines "4.input"
p1 ← +´ {𝕊a‿b‿x‿y: ((a≤x)∧(b≥y))∨((a≥x)∧(b≤y))} ranges
p2 ← +´ {𝕊a‿b‿x‿y: ((a≤x)∧(x≤b))∨((x≤a)∧(a≤y))} ranges
p1‿p2
