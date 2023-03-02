num ← ≠ moves ← "<>" (-˝=⎉0‿1) ¯1 ↓ •file.Chars "17.input"
rocks ← ⟨3,1,1,0,2⟩ -⊸⌽¨ ¯2 ⌽˘¨ (<4‿7) ↑¨ ⟨1‿4⥊1, 1¨⌾(1⊏⊢) 1¨⌾(1⊏˘⊢) 3‿3 ⥊ 0, 1¨⌾(2⊏⊢) 1¨⌾(2⊏˘⊢) 3‿3 ⥊ 0, 4‿1 ⥊ 1, 2‿2 ⥊ 1⟩

Shift ← { space 𝕊 ⟨move, rock, row⟩:
 r ← move ⌽˘ rock
 {  ∨´ (0 ⌊ move) ⊏˘ rock ? rock ;
  r ∨´∘⥊∘∧ (¯4 ↑ (1 + row) ↑ space) ? rock ;
  r
 }
}

Step ← { Step ⟨space, rock, row, r, jet, h⟩:
 #Print ⟨space, rock, row⟩
 rock ↩ space Shift ⟨jet ⊑ moves, rock, row⟩
 #Print ⟨space, rock, row⟩
 { (¯4 ↑ (2 + row) ↑ space) ∨´∘⥊∘∧ rock ?
   Fix ⟨space, rock, row, 1 + r, num | 1 + jet, h⟩ ;
   ⟨space, rock, row + 1, r, num | 1 + jet, h⟩
 }
}

Fix ← { 𝕊 ⟨space, rock, row, r, j, h⟩:
 space ↩ (rock ∨ ⊢) ⌾ (¯4 ↑ ⊢) ⌾ ((4 + 1 + row) ↑ ⊢) (4‿7 ⥊ 0) ∾ space
 space ↩ (4 -˜ ⊑ / ∨´˘ space) ↓ space
 space‿h ↩ { 1000 < ≠space ? ⟨¯100 ↓ space, h + 100⟩ ; space‿h }
 ⟨space, (5|r) ⊑ rocks, 0, r, j, h⟩
}

Print ← { 𝕊 ⟨space, rock, row⟩:
 •Show ".#@" ⊏˜ ((2×rock) + ⊢) ⌾ (¯4 ↑ ⊢) ⌾ ((4 + 1 + row) ↑ ⊢) (4‿7 ⥊ 0) ∾ space
}

p1 ← {(5 ⊑ 𝕩) + ¯5 + ≠⊑𝕩} Step •_while_ (2022 > 3 ⊑ ⊢) ⟨(4‿7 ⥊ 0) ∾ 1‿7 ⥊ 1, ⊑rocks, 0, 0, 0, 0⟩
cycle ← 5 × num
stages ← Step ⍟ (cycle × 1 + ↕8) ⟨(4‿7 ⥊ 0) ∾ 1‿7 ⥊ 1, ⊑rocks, 0, 0, 0, 0⟩
blocks ← -⟜»˜ 3 ⊑¨ stages
grown ← -⟜»˜ {¯5 + (≠⊑𝕩) + 5 ⊑ 𝕩}¨ stages
pblocks ← +´¨ (/5‿3) ⊔ 8 ↑ blocks
pgrown ← +´¨ (/5‿3) ⊔ 8 ↑ grown
dropped ← 1000000000000
base ← (⊑pgrown) + (1⊑pgrown) × ⌊ (1⊑pblocks) ÷˜ dropped - (⊑pblocks)
rem ← (1⊑pblocks) | dropped - (⊑pblocks)
p2 ← {
 ⟨space, rock, row, r, j, h⟩ ← ⊑stages
 {(5⊑𝕩) + ¯5 + ≠⊑𝕩} Step •_while_ { 𝕊⟨space, rock, row, r, j, h⟩: r ≤ dropped } ⟨space, rock, row, dropped - rem, 0, 4 + base - ≠space⟩
}
p1‿p2
