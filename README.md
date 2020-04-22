# HeytinGET

Find an intuitionistic counter-model for a proposition.

## Some of its central features:
- Topological semantics.
- Kernel build upon GNU/Bison.

## Heyting poset

Let $`\mathbb{P} = (P, \leq)`$ be partially ordered set with a minimal element. If, for every $`x,y \in P`$, the following properties holds

```math
max \space \{ z : z \leq x \space and \space z \leq y \} \space (x \land y) \\
max \space \{ z : x \leq z \space and \space y \leq z \} \space (x \lor y) \\
max \space \{ z : x \land z \leq y \}  \space (x \rightarrow y) \\
```

then we say that it is a Heyting poset (named after the famous mathematician Arend Heyting).

## Example

<div align="center">

![Image description](example.png)

</div>