#!/bin/env BQN
# Evaluates a given bqn script, and prepends its name to the result
Run ← ((•BQN ¯4↓⊢) ∾ •Import)
# Add a header row to the output table and print
•Show >(<"Day"‿"Part 1"‿"Part 2") ∾ {
 # If any arguments other than a single day is passed, find and load all of the days
 1≠≠ •args ? Run¨ (((<"run.bqn") ≢¨ ⊢)/⊢) (((<".bqn") ≡¨ ¯4↑¨⊢)/⊢) •file.List "." ;
 # Else load the specified day
 < Run (⊑•args) ∾ ".bqn"
}
