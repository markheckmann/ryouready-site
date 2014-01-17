#image with R code in the background
code <- c( "par(mar=rep(0,4))",
           "plot.new()",
           "plot.window(xlim=0:1, ylim=0:1, xaxs='i')",
           "s <- seq(0,1, len=10)",
           "abline(h=s, v=s, col='black')",
           "xy <- expand.grid(s, s)",
           "ps <- s[-length(s)] + .05",
           "xyp <- expand.grid(ps, ps)",
           "p <- .2",
           "set.seed(0)",
           "numbers <- sample(1:5, 100, rep=T)",
           "text(xyp, labels =numbers)",
           "foo <- function(x) log(x)/10",
           "ddply(mtcars, .(cyl, am), \n             summarise, mean=mean(mpg))")

d <- read.table(text="
0.3256824 0.7543652
0.4163053 0.5230444
0.7869254 0.7099757
0.8719766 0.9431202
0.2714296 0.4230299
0.8636312 0.7608284
0.9029740 0.8944994
0.6616781 0.2803211
0.6347469 0.6539227
0.1525183 0.2067218
0.2750784 0.3271376
0.2500732 0.4281970
0.6839694 0.1113818
0.4264882 0.4250298")
names(d) <- c("x", "y")
d$code <- code
png("../img/ryouready-bg.png", 500, 500, bg="transparent") 
  par(mar=rep(0,4))
  plot.new()
  plot.window(xlim=0:1, ylim=0:1, xaxs="i", yaxs="i")
  s <- seq(0,1, len=10)
  abline(h=s, v=s, col="#00000040")
  xy <- expand.grid(s, s)
  ps <- s[-length(s)] + .05
  set.seed(0)
  pointLabel(d[1:10, 1:2], labels=d$code[1:10], cex=1.2, family="mono",col="#00000040")
dev.off()
