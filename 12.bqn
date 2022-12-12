map ← ((53 × 'E' = ⊢) + ('S' ≠ ⊢) × 'a' -˜ ⊢) text ← > •file.Lines "12.input"
start ← (⊑ ⊢ /○⥊ ↕∘≢) 'S' = text
end ← (⊑ ⊢ /○⥊ ↕∘≢) 'E' = text
# Left Right Up Down
Neighbours ← {[∞ »˘ 𝕩, ∞ «˘ 𝕩, ∞ »˘⌾⍉ 𝕩, ∞ «˘⌾⍉ 𝕩]}
costs ← (1 ≥ map -⎉2 Neighbours map) ⊏ ⟨∞, 1⟩
Step ← ⊢ ⌊˝ ⊣ + Neighbours
uphill ← ((1 ≥ map -⎉2 Neighbours map) ⊏ ⟨∞, 1⟩˙) map
downhill ← ((1 ≥ map -˜⎉2 Neighbours map) ⊏ ⟨∞, 1⟩˙) map
p1 ← end ⊑ uphill Step ⍟ 1000 (0⌾(start ⊑ ⊢) ≢⥊∞˙) map
p2 ← ⌊´ (text = 'a') /○⥊ downhill Step ⍟ 1000 (0⌾(end ⊑ ⊢) ≢⥊∞˙) map
p1‿p2
