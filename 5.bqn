⟨Int⟩←•Import "util.bqn"
initial‿moves ← (⊑∘/ 0=≠¨)⊸(¯1⊸+⊸↑⋈1⊸+⊸↓) •file.Lines "5.input"
stacks ←' '⊸≠⊸/¨ <˘⌽˘(1+4×↕⌈4÷˜≠⊑initial)⊏⍉>initial
moves ↩ 0‿1‿1 -˜⎉1 Int¨ 1‿3‿5⊸⊏⌾⍉ >(⊢-˜¬×+`)∘(' '=⊢)⊸⊔¨ moves
Shift ← { s‿flip 𝕊 n‿from‿to:
 c ← ⌽⍟flip (-n) ↑ from ⊑ s
 s ↩ (c ∾˜ ⊢) ⌾ (to⊸⊑) s
 s ↩ ((-n) ↓ ⊢) ⌾ (from⊸⊑) s
 s‿flip
}

p1 ← ¯1 ⊑¨ ⊑ stacks‿1 Shift˜˝ ⌽ moves
p2 ← ¯1 ⊑¨ ⊑ stacks‿0 Shift˜˝ ⌽ moves
p1‿p2
