⟨Int, _split⟩ ← •Import "util.bqn"

words ← ' '⊸= _split¨ •file.Lines "16.input"
valves ← 1 ⊑¨ words
flows ← (Int ⊢ /˜ ('0'+↕10) ∊˜ ⊢ )¨ 4 ⊑¨ words
outputs ← 2 ↑¨¨ 9 ↓¨ words
adj ← > valves ∊⚇2 outputs
MMul ← 1 ⌊ ⊣ +˝∘× ⎉ 1‿∞ ⊢
nzf ← / (0 < flows) ∨ valves ≡¨ <"AA"
dist ← ⊑∘/⎉1 ⍉> (<(1¨⌾(0‿0⍉⊢) ≢⥊0˙) adj) ∾ MMul⍟(↕30)˜ 1¨⌾(0‿0 ⍉ ⊢) adj
start ← / (<"AA") ⍷ nzf ⊏ valves
graph ← (<nzf) ⊏˘ nzf ⊏ dist
costs ← nzf ⊏ flows
watermark ← ¯∞
count ← 0

Walk ← { end Walk t‿open‿positions‿busy:
 { end ≤ t    ? +´ (open ≠ ∞) / costs × 0 ⌈ end - open ;
   ∞ > ⌈´open ? +´ costs × end - open ;
   moves ← Travel ⟨t, open, positions, busy⟩
   scores ← end Walk¨ moves
   best ← ⌈´ scores
   { watermark < best ? watermark ↩ best, •Show ⟨watermark, count⟩; count 1⊸+↩ }
   best
 }
}

Travel ← {𝕊 ⟨t, open, positions, busy⟩:
 possible ← (open = ∞) / <˘⍉> (↕∘≠ ⋈ t + 1 + ⊢) (⊑positions) ⊏ graph
 (<positions‿busy) { positions‿busy 𝕊 new‿delay:
  p ← New ⌾ ⊑ positions
  b ← delay ⌾ ⊑ busy
  grade ← ⍋ b
  ⟨⊑ grade ⊏ b, delay ⌾ (new ⊑ ⊢) open, grade ⊏ p, grade ⊏ b⟩
 }¨ possible
}

#p1 ← 30 Walk ⟨0, 0⌾(start ⊑ ⊢) ∞¨nzf,   start,  ⋈0⟩
#p2 ← 26 Walk ⟨0, 0⌾(start ⊑ ⊢) ∞¨nzf, 2⥊start, 0‿0⟩
#p1‿p2
