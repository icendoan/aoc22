⟨Int, _split⟩ ← •Import "util.bqn"
⟨Hashmap⟩ ← •Import "../bqn-libs/hashmap.bqn"
Combinations ← ∾·(⍉∾˘¨⟜(∾˜`)˝˜≠↑(↓≍↕0)˙)⌾⌽↕⟜↕ # from bqncrate

words ← ' '⊸= _split¨ •file.Lines "16.test"
valves ← 1 ⊑¨ words
flows ← (Int ⊢ /˜ ('0'+↕10) ∊˜ ⊢ )¨ 4 ⊑¨ words
outputs ← 2 ↑¨¨ 9 ↓¨ words
adj ← > valves ∊⚇2 outputs
MMul ← 1 ⌊ ⊣ +˝∘× ⎉ 1‿∞ ⊢
nzf ← / 0 < flows
dist ← ⊑∘/⎉1 ⍉> (<(1¨⌾(0‿0⍉⊢) ≢⥊0˙) adj) ∾ MMul⍟(↕30)˜ 1¨⌾(0‿0 ⍉ ⊢) adj

cache ← Hashmap˜ ⟨⟩

Step ← { # rem‿open‿pos ← 𝕩
 0≥⊑𝕩 ? 0 ;
 cache.Has 𝕩 ? cache.Get 𝕩 ;
 open ← +´ flows × 1 ⊑ 𝕩
 trees ← Moves 𝕩
 wait ← open × (⊑𝕩) - ⊑¨ trees
 score ← ((⊑𝕩) × open) ⌈´ wait + 𝕊¨ trees
 𝕩 cache.Set score
 score
}

Moves ← { 𝕊 rem‿open‿pos:
 good ← (pos ≠ ⊢)⊸/ nzf
 t ← good ⊏ pos ⊏ dist
 good ↩ (t≤rem) / good
 t ↩ (t≤rem) / t
 tunnels ← t { t𝕊p: ⟨rem - t, open, p ⟩}¨ good
 { pos ⊑ open ? tunnels ; tunnels ∾ <⟨ rem - 1, 1⌾(pos ⊑ ⊢) open, pos ⟩ } 
}

Elephant ← { 𝕊𝕩:
 0 ≥ ⊑𝕩 ? 0 ;
 cache.Has 𝕩 ? cache.Get 𝕩 ;
 open ← +´ flows × 1 ⊑ 𝕩
 ⟨t, open, positions⟩ ← 𝕩
 # todo
}

p1 ← Step ⟨30, 0¨ valves, ⊑/ (<"AA") ⍷ valves⟩
#p2 ← Elephant ⟨30, 0¨ valves, 2 ⥊ ⊑/ (<"AA") ⍷ valves⟩
