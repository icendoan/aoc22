#!/bin/env BQN
# Evaluates a given bqn script, and prepends its name to the result
⟨Int⟩ ← •Import "util.bqn"
Run ← ((Int ¯4↓⊢) <⊸∾ •Import)
days ← ∧ {n‿e←⊑∘⊒⟜'.'⊸(↑⋈↓)𝕩⋄(e≡".bqn")∧´n∊'0'+↕10}¨⊸/ •file.List "."
# Add a header row to the output table and print
•Show > (<"Day"‿"Part 1"‿"Part 2") ∾ ∧ {
 # If any arguments other than a single day is passed, find and load all of the days
 1≠≠ •args ? Run¨ days ;
 # Else load the specified day
 < Run (⊑•args) ∾ ".bqn"
}
