trees ← > '0' -˜ •file.Lines "8.input"
p1 ← (+´∘⥊ ⊢ > ((≠ ⥊ ¯1˙) » ⌈`) ⌊ ((≠ ⥊ ¯1˙) » ⌈`)⌾⌽ ⌊ (¯1 » ⌈`)˘ ⌊ (¯1 » ⌈`)⌾⌽˘) trees
Sightlines ← { trees 𝕊 row‿col:
  tree ← row‿col ⊑ trees
  up‿down ← row (⌽∘↑ ⋈ 1⊸+⊸↓) col ⊏˘ trees
  left‿right ← col (⌽∘↑ ⋈ 1⊸+⊸↓) row ⊏ trees
  views ← ⟨up, down, left, right⟩
  edge ← (0<≠¨) views
  blocked ← ∨´¨ tree ≤ views
  ×´ edge × blocked + +´¨ tree > ⌈`¨ views
 }
p2 ← ⌈´ ⥊ (<trees) Sightlines¨ ⥊↕≢trees
p1‿p2
