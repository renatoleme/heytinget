# HeytinGET

Find an intuitionistic counter-model for a proposition.

## Some of its central features:
- Topological semantics.
- Kernel build upon GNU/Bison.

## Heyting poset

Let $`\mathfrak{H} = (P, \leq)`$ be partially ordered set with a minimal element. If, for every $`x,y \in P`$, the following properties holds

```math
max \space \{ z : z \leq x \space and \space z \leq y \} \space \equiv \space (x \land y) \\
max \space \{ z : x \leq z \space and \space y \leq z \} \space \equiv \space (x \lor y) \\
max \space \{ z : x \land z \leq y \}  \space \equiv \space (x \rightarrow y) \\
```

then we say that $`\mathfrak{H}`$ is a Heyting poset (named after the logician Arend Heyting).

As is widely known, every Heyting poset is a topology. So, let $`T = (X, \tau)`$ be a topology, then we can re-define those operator in terms of its topological counterparts 

```math
O_x \cap O_y \space \equiv \space (x \land y) \\
O_x \cup O_y \space \equiv \space (x \lor y) \\
O_{(X - O_x)} \cup O_y  \space \equiv \space (x \rightarrow y) \\
```

without any loss of generality.

## Example

<div align="center">

![Image description](example.png)

</div>
