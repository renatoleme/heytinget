library(diagram)
library(draw)
library(stringr)
library(datasets)


options(repr.plot.width=600, repr.plot.height=800)

openplotmat(main = "⊢ ((p → q) → p) → p")

pos <- coordinates(c(1, 1, 1, 1))


straightarrow(from = pos[1, ], to = pos[2, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")

straightarrow(from = pos[2, ], to = pos[3, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")

straightarrow(from = pos[2, ], to = pos[1, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")

straightarrow(from = pos[3, ], to = pos[4, ], arr.pos = 1, lcol = "black", lwd = 3, arr.type="circle", arr.col="black")






textellipse(pos[2, ], lab = "p", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
textellipse(pos[3, ], lab = "q", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
#textellipse(pos[8, ], lab = "r", cex = 1, radx = 0.03, rady = 0.03, box.col="grey", shadow.size=0.005, shadow.col = "black", col = "black")
