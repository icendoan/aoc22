⟨Int, _split⟩←•Import "util.bqn"
lines ← •file.Lines "11.input"
Operation ← { 𝕊"old": "⊢"; 𝕊"*": "×"; 𝕊"+": "+"; 𝕊𝕩: 𝕩∾'˙' }
Monkey ← { 𝕊m:
 items ← Int¨ (×≠¨)⊸/ (('0'+↕10) ¬∘∊˜ ⊢) _split 1 ⊑ m
 op ← •BQN ∾ Operation¨ (' '=⊢) _split (≠"  Operation: new = ") ↓ 2 ⊑ m
 test ← Int (≠"  Test: divisible by ") ↓ 3 ⊑ m
 true ← Int (≠"    If true: throw to monkey ") ↓ 4 ⊑ m
 false ← Int (≠"    If false: throw to monkey ") ↓ 5 ⊑ m
 items‿op‿test‿true‿false
}

monkeys ← start ← > Monkey¨ (0=≠¨) _split lines
n ← ×´ 2 ⊏˘ monkeys
inspected ← (≠monkeys) ⥊ 0
relief ← 3
Run ← { 𝕊 turn:
 items‿op‿test‿true‿false ← turn ⊏ monkeys
 inspected ↩ ((≠items)+⊢)⌾(turn ⊑ ⊢) inspected
 worry ← n | ⌊ relief ÷˜ Op items
 dirs ← (0 ≠ test | worry) ⊏ ⟨true, false⟩
 throws ← dirs ((·⍷⊣) ⋈¨ ⊐⊸⊔) worry
 monkeys ↩ ⟨⟩⌾(turn‿0 ⊑ ⊢) monkeys
 { 𝕊 dir‿thrown: monkeys ↩ (⊢∾Thrown)⌾(dir‿0 ⊑ ⊢) monkeys }¨ throws
 @
}
Reset ← {𝕊𝕩: monkeys ↩ start, inspected ↩ (≠monkeys) ⥊ 0}
p1 ← { Reset @, relief ↩ 3, {𝕊𝕩: Run¨↕≠monkeys}⍟20    @, ×´2↑∨inspected }
p2 ← { Reset @, relief ↩ 1, {𝕊𝕩: Run¨↕≠monkeys}⍟10000 @, ×´2↑∨inspected }
p1‿p2
