⟨Int, _split⟩ ← •Import "util.bqn"
corners ← Int⚇¯3 (','=⊢) _split⚇¯2 ("->"≢⊢)¨⊸/¨ (' '=⊢) _split¨ •file.Lines "14.input"
lines ← (⊏∾1↓⊢-¯1⌽⊢)¨ corners
origin ← ⟨∞, 0⟩ ⌊´ ∾ corners
space ← origin +⚇1 ¯1 + (↕ 3 + ⌈´ - Origin) ∾ corners
start ← 500‿0 - ⊑space
Draw ← {w𝕊x: {2=≡w?¯1⊏w;w} +⚇1 (<×x) × ↕1+⌈´|x }
points ← ⍷∾ {(<⊑𝕩)∾∾1↓𝕩}¨ draw`¨ lines
stone ← grid ← space ∊ points
Shift ← {
 𝕨𝕊1‿1: grid 1⌾(𝕨 ⊑ ⊢) ↩, ∞‿∞;
 𝕨𝕊0‿n: 𝕨 + ¯1‿1;
 𝕨𝕊1‿0: 𝕨 + 1‿1;
 𝕨𝕊𝕩: !˜ "Unhandled case"‿𝕩
}

Cast ← {𝕊x‿y:
 stops ← (y<⊢)⊸/ / x ⊏⎊⟨⟩ grid, { 1≤≠stops ? c ← ⊑stops, ⟨x, c-1⟩ Shift ⟨⟨x-1, c⟩, ⟨x+1, c⟩⟩ ⊑ grid ; ¯∞‿¯∞ }
} •_while_ ((∞‿∞ ≢ |))
{𝕊𝕩: Cast •_while_ (∞‿∞ ≢ |) start} •_while_ (∞‿∞ ≡ ⊢) ∞‿∞
p1 ← +´ ⥊ stone -˜ grid

# increase the size of the grids
stone (∾⟜1˘ (≢⥊0˙)⊸(⊣∾⊢∾⊣)⍟2) ↩
grid  (∾⟜1˘ (≢⥊0˙)⊸(⊣∾⊢∾⊣)⍟2) ↩
start ((4×≠space)‿0 + ⊢) ↩

{𝕊𝕩: Cast start} •_while_ {𝕊𝕩: 0 = start ⊑ grid} @
p2 ← +´ ⥊ stone -˜ grid
