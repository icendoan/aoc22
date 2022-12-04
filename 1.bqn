⟨Int⟩ ← •Import "util.bqn"
# Take the file as a list of lines, and compute each line's *group* by
# counting the number of separators (lines of length 0) before it.
# It first computes a separator mask 0⊸=≠¨, and takes a partial sum 1+`
# (the start at 1 ensures we include the first group, and we want to use 0 as the group for the separators)
# Then, drops the separators from each group by multiplying by the negated mask
# This produces our inputs as a list of lists of lines. Drop the empty lines, and then
# read each as a BQN program, which yields its integer value
# Finally, sum up the calorie count of each elf
elves ← +´¨ Int⚇¯2 1↓ (¬×1+`⊢)∘(0⊸=≠¨)⊸⊔ •file.Lines "1.input"
# the most calorie-rich elf
p1 ← ⌈´ elves
# the sum of the 3 most calorie rich elves
p2 ← +´ 3↑ ∨ elves
p1‿p2
