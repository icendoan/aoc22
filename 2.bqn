moves ← (⥊"ABC"≍⌜"XYZ") ⊐ 0‿2⊸⊏¨ •file.Lines "2.input"
#1 ←  A A A B B B C C C 
#2 ←  X Y Z X Y Z X Y Z 
s1 ← [4,8,3,1,5,9,7,2,6]
s2 ← [3,4,8,1,5,9,2,6,7]
p1 ← +´ s1 ⊏˜ moves
p2 ← +´ s2 ⊏˜ moves

p1‿p2
