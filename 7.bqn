⟨Int⟩ ← •Import "util.bqn"
lines ← •file.Lines "7.input"
push  ← "$ cd"⊸≡¨ 4↑¨ lines
pop   ← "$ cd .."⊸≡¨ lines
depth ← +` push - 2 × pop
files ← (('$' ≠ ⊑)¨ ∧ ("dir" ≢ 3 ↑ ⊢)¨) lines
sizes ← files × (Int ⊒⟜' ' ↑ ⊢)¨ lines
dirs  ← ¯1 ⊑¨ {𝕨𝕊1‿x:1‿x;𝕨}` <˘ (push≠pop) ⍉∘≍ 5↓¨lines
subs  ← {("dir"≡3↑⊢) 𝕩 ? 4 ↓ 𝕩 ; ""}¨ lines
t ← ⍉[lines, dirs, depth, files, sizes, subs]

resolved ← { 𝕊 d:
 mask ← depth = d 
 leaves ← ⍷ mask / dirs 
 pruned ← +´¨ dirs ⊐⊸⊔○(mask⊸/) sizes 
 sizes ↩ sizes + (leaves ⊐ subs) ⊏ pruned ∾ 0 
}¨ ∨⍷depth

total ← +´¨ dirs ⊐⊸⊔ sizes

•Show ⍉ (⍷dirs) ≍ total

p1 ← +´ (100000≥⊢)⊸/ total
p2 ← 0

p1‿p2
