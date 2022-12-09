⟨Int⟩ ← •Import "util.bqn"
moves ← (1⊸↑ ⋈ 2 Int∘↓ ⊢)¨ •file.Lines "9.input"
heads ← +` ∾ { 𝕊d‿n: n / ("UDLR" ⊐ d) ⊏ ⟨1‿0, ¯1‿0, 0‿¯1, 0‿1⟩ }¨ moves
Yank ← {
 # If touching, then don't move yet
 tail 𝕊 head: ∧´ 1 ≥ | head - tail ? tail ;
 # Otherwise move one step in the direction of head, possibly diagonally
 tail 𝕊 head: tail + × head - tail
}

p1 ← ≠⍷ (<0‿0) Yank` heads 
p2 ← ≠⍷ (<0‿0) Yank`⍟9 heads
p1‿p2
