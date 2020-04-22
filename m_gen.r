library(diagram)
library(draw)
library(stringr)
library(datasets)


options(repr.plot.width=600, repr.plot.height=800)

openplotmat(main = "Counter Model for (¬ p → (q ∨ r)) ⊢ ((¬ p → q) ∨ (¬ p → r))")


pos <- coordinates(c(1, 1, 3, 3, 1))


straightarrow(from = pos[2, ], to = pos[1, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")


straightarrow(from = pos[5, ], to = pos[2, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[4, ], to = pos[2, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[3, ], to = pos[2, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")

straightarrow(from = pos[8, ], to = pos[4, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[8, ], to = pos[5, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[7, ], to = pos[5, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[7, ], to = pos[3, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[6, ], to = pos[3, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[6, ], to = pos[4, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")


straightarrow(from = pos[9, ], to = pos[8, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[9, ], to = pos[7, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[9, ], to = pos[6, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")
straightarrow(from = pos[6, ], to = pos[9, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")


textellipse(pos[6, ], lab = "p", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
textellipse(pos[7, ], lab = "q", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
textellipse(pos[8, ], lab = "r", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
