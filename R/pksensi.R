library(pksensi)
library(hexSticker)

q <- "qunif"
q.arg <- list(list(min = 0.6, max = 0.8),
              list(min = 0.5, max = 0.8),
              list(min = 0.1, max = 0.3),
              list(min = 15, max = 20))

params <- c("F","KA","KE","V")

set.seed(1234)
x <- rfast99(params = params, n = 200, q = q, q.arg = q.arg, rep = 20)

time <- seq(from = 0.25, to = 12.25, by = 0.5)
y <- solve_fun(x, model = FFPK, time = time, vars = "output")

col_bg <- "#ECECEC"  
col_border <- "#800000"
col_text <- "#800000"    ##  carrara

sticker(expression(pksim(y, legend =F, bty="n", frame.plot=TRUE, axes=F)),
        package="pksensi", p_family = "Aller_BdIt",
        p_y = 1.4, p_size=9, p_color = col_text,
        s_y= 0.6, s_x= 0.75, s_width=2.2, s_height=1.6,
        h_fill = col_bg, h_color = col_border, h_size = 1.8,
        url = "github.com/nanhung/pksensi", 
        u_color = col_border, u_size = 1,
        filename="PNG/pksensi.png")
