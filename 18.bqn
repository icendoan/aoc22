⟨_split, Int⟩ ← •Import "util.bqn"
points ← (Int¨ ','⊸= _split)¨ •file.Lines "18.input"
p1 ← +´ 6 - +´˘ 0‿0‿1 <⊸(≡¨) ∧¨ |∘-⌜˜ points
