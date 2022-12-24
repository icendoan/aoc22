⟨_split, _fix⟩ ← •Import "util.bqn"
sensors‿beacons ← <˘⍉> {2 (↑⋈↓) •BQN¨ (⟨⟩⊸≢¨)⊸/ (¬ ('-'∾'0'+↕10) ∊˜ ⊢) _split 𝕩}¨ •file.Lines "15.input"
distances ← +´¨ | sensors - beacons
Ranges ← { 𝕊row: ∧ (≤´¨)⊸/ distances {d𝕊x‿y: x (-⋈+) d - | row - y}¨ sensors}
Overlaps ← {a‿b𝕊x‿y: ((a≤x)∧(x≤b))∨((x≤a)∧(a≤y))∨(1=|b-x)∨(1=|a-y)}
Merge ← {{ curr 𝕊 acc:
  m ← (<curr) (Overlaps ∨ Overlaps˜)¨ acc
  { ∨´ m ? n ← ⊑/m, (curr {a‿b𝕊x‿y:⟨a⌊x,b⌈y⟩} ⊢) ⌾ (n ⊑ ⊢) acc ; acc ∾ <curr }
}´ 𝕩∾<⟨⟩}

p1 ← (¬´ ⌽ ⊑ Merge _fix Ranges 2e6) - ≠⍷ (2e6 = ¯1 ⊑ ⊢)¨⊸/ beacons
#{ (1 ≠ ≠ r ← Merge _fix Ranges 𝕩) ? •Show 𝕩‿r ; 0=1e5|⊑𝕩 ? •Show 𝕩 ; @ }¨ ↕1+4e6
p1‿11374534948438
