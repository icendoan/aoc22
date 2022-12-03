sacks ← •file.Lines "3.input"
p ← ⥊ "aA" +⌜↕26
p1 ← +´ 1 + p ⊐ ∾ (⍷∊/⊣)˝¨ 2‿∘⊸⥊¨ sacks
p2 ← +´ 1 + p ⊐ ⥊ (⍷ (∊/⊣)´)˘ ∘‿3 ⥊ sacks
p1‿p2
