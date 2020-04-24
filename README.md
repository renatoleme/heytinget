# HeytinGET

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)
[![PyPI pyversions](https://img.shields.io/pypi/pyversions/3)](https://pypi.python.org/pypi/ansicolortags/)

Find an intuitionistic counter-model for a proposition.

## Some of its central features:
- Topological semantics.
- Kernel build upon GNU/Bison.

## Algorithm

In what follows we expose the algorithm main lines, as well an informal proof of its correctness.

### Definitions

Let $`\mathfrak{H} = (P, \leq)`$ be partially ordered set with a minimal element. If, for every $`x,y \in P`$, the following properties holds

```math
max \space \{ z : z \leq x \space and \space z \leq y \} \space \equiv \space (x \land y) \\
max \space \{ z : x \leq z \space and \space y \leq z \} \space \equiv \space (x \lor y) \\
max \space \{ z : x \land z \leq y \}  \space \equiv \space (x \rightarrow y) \\
```

then we say that $`\mathfrak{H}`$ is a Heyting poset (named after the logician Arend Heyting).

As is widely known, every Heyting poset is a topology. So, let $`T = (X, \tau)`$ be a topology, then we can re-define these operators in terms of their topological counterparts 

```math
O_x \cap O_y \space \equiv \space (x \land y) \\
O_x \cup O_y \space \equiv \space (x \lor y) \\
O_{(X - O_x)} \cup O_y  \space \equiv \space (x \rightarrow y) \\
```

without any loss of generality.

### Logical justification

We take for granted (via Deduction Theorem) that, given a set $`\Gamma = \{ \varphi_0, \varphi_1, \varphi_2, ..., \varphi_n \}`$ of propositions, we have

```math
\Gamma \vdash_i \varphi \space \Rightarrow \space \vdash_i \bigwedge\limits_{i=0}^n \{ \Gamma \} \rightarrow \varphi
```

Let $`\psi \equiv \bigwedge\limits_{i=0}^n \{ \Gamma \} \rightarrow \varphi `$. So, via correctness of $`\vdash_i`$,

```math
\vdash_i \psi \Rightarrow T \models \psi
```

and then

```math
T \nvDash \psi \Rightarrow \neg (\vdash_i \psi)
```

so if a topology $`T`$ do not models a proposition $`\psi`$, then this proposition is not intuistionistically provable.

### The HeytinGET way

Every input (a given proposition) is translated into a semantically equivalent expression of pertinency in open sets of an arbitrary topology $`T`$.

```shell
for topo in $(cat topos.t)
do
	sed "s/%EXPR/$expr/g" is_cm.py > eval.py
	sed -i -e "s/%TOPOLOGY/$topo/g" eval.py 
	python eval.py $n_prop
done
```

The idea is to look at every topology pre-seted on [topos.t](src/topos.t) file with every possible valuation.

### Algorithm correctness

We can easily see that this algorithm is correct in the following sense: 

If there exists a valuation for a given counter-model in [topos.t](src/topos.t) in which the proposition do not hold, then the program will output this model with that valuation, once we have that our loop is over every line of the file. So, if the proposition is not intuistionistically provable in any model of the universe of our topologies database, then we can guarantee that the program will indicate us that.

## Examples

<div align="center">

![Image description](res/examples.png)

</div>

## Usage

```console
user@host:~$ zsh h_cmodel.sh "proposition"
```
