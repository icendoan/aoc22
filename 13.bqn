⟨_split⟩ ← •Import "util.bqn"
packets ← •BQN⎊0¨ {m←/'['=𝕩 ⋄ n←/']'=𝕩 ⋄ '⟩'¨⌾(n⊏⊢) '⟨'¨⌾(m⊏⊢) 𝕩}¨ •file.Lines "13.input"
# this works but is a hack, and doesn't work for p2
p1 ← +´1+/(⊢≡∧)¨ (0≡⊢)¨ _split packets
padded ← ⟨⟨2⟩⟩ <⊸∾ ⟨⟨6⟩⟩ <⊸∾ (0≢⊢)¨⊸/ packets
# if only...
# p2 ← ×´1+2↑⍋⍋ s ← ⟨⟨2⟩⟩ <⊸∾ ⟨⟨6⟩⟩ <⊸∾ (0≢⊢)¨⊸/ packets

Compare ← {
 ((1=•Type 𝕨)∧(1=•Type 𝕩)) ? × 𝕨 - 𝕩 ;
 ((0=•Type 𝕨)∧(0=•Type 𝕩)) ?
  n ← 𝕨 ⌊○≠ 𝕩 ⋄
  r ← ⊑⎊0 (0 ≠ ⊢)⊸/ 𝕨 𝕊¨○(n↑⊢) 𝕩 ⋄
  𝕨 { r ≠ 0 ? r ; × 𝕨 -○≠ 𝕩 } 𝕩 ;
  ((1=•Type 𝕨)∧(0=•Type 𝕩)) ? (⋈𝕨) 𝕊 𝕩 ;
  ((0=•Type 𝕨)∧(1=•Type 𝕩)) ? 𝕨 𝕊 ⋈𝕩 ;
  !˜ "Unhandled case"‿(•Type 𝕨)‿(•Type 𝕩)
}

p2 ← ×´ 1 + 2 ↑ ⍋⍋ +´˘ Compare⌜˜ padded
