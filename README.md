# HeytinGET

Find a counter-model and a valuation for the corresponding heyting poset for a proposition.

## Heyting poset

A Heyting poset (named after the famous mathematician Arend Heyting) is a partially ordered set with the following properties:

```math
1 & max \space \{ z : z \leq x \space and \space z \leq y \} \space (x \land y) \\
2 & max \space \{ z : x \leq z \space and \space y \leq z \} \space (x \lor y) \\
3 & max \space \{ z : x \land z \leq y \}  \space (x \rightarrow y) \\
```

## Some of its central features:
- Topological semantics.
- Kernel build upon GNU/Bison.

## Example

![Image description](example.png)
