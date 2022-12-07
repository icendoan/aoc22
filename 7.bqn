⟨Int⟩ ← •Import "util.bqn"
lines ← •file.Lines "7.input"
push  ← "$ cd"⊸≡¨ 4↑¨ lines
pop   ← "$ cd .."⊸≡¨ lines
depth ← +` push - 2 × pop
files ← (('$' ≠ ⊑)¨ ∧ ("dir" ≢ 3 ↑ ⊢)¨) lines
start ← sizes ← files × (Int ⊒⟜' ' ↑ ⊢)¨ lines
subs  ← {("dir"≡3↑⊢) 𝕩 ? 4 ↓ 𝕩 ; ""}¨ lines
paths ← (<⟨⟩) { s 𝕊 "$ cd ..": ¯1 ↓ s ; s 𝕊 cmd: "$ cd" ≡ 4↑cmd? s∾⋈5↓cmd;𝕨}` lines

{ 𝕊 d:
 mask ← depth = d
 leaves ← ⍷ mask / paths
 pruned ← +´¨ paths ⊐⊸⊔○(mask⊸/) sizes
 sizes ↩ sizes + (⟨⟩⊸≢¨ subs) × (leaves ⊐ paths ∾⟜⋈¨ subs) ⊏ pruned ∾ 0
} ¨ ∨⍷depth

total ← +´¨ paths ⊐⊸⊔ sizes
p1 ← +´ (100000 ≥ ⊢)⊸/ total
p2 ← ⌊´ (3e7 ≤ total + 7e7 - +´ start) / total
p1‿p2
