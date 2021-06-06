# install.packages("stringi")
# install.packages("stringr")
# install.packages("lattice")
# install.packages("ggplot2")
# install.packages("ggExtra")
# install.packages("hrbrthemes")
# install.packages("tidyverse")
# install.packages("rgl")
# install.packages("GGally")

library("stringi")
library("stringr")
library("lattice")
library("ggplot2")
library("ggExtra")
library("hrbrthemes")
library("rgl")
library("tidyverse")
library("GGally")

source("modules/split-url.r")
source("modules/url-ambiguity.r")
source("modules/url-lengths.r")
source("modules/url-special-symbol-count.r")

# Mendeley Data : Dataset of Malicious and Benign Webpages
dfm <- read.csv("data/Webpages_Classification_10k.csv",  row.names = "X") 

# Aalto University : PhishStorm - phishing / legitimate URL dataset
dfp <- read.csv("data/PhishStorm_urlset_96k.csv") 

dfm[c("content", "url_len", "ip_add")] <- NULL
dfm$label <- factor(dfm$label)
head(dfm)


colnames(dfp)[1] <- "url"
dfp[c("card_rem", "ratio_Rrem", "ratio_Arem", 
      "jaccard_RR", "jaccard_RA", "jaccard_AR", 
      "jaccard_AA", "jaccard_ARrd", "jaccard_ARrem")] <- NULL
dfp$label <- factor(dfp$label)
levels(dfp$label) <- c("good", "bad")

dfp$mld_res <- factor(dfp$mld_res)
dfp$mld.ps_res <- factor(dfp$mld.ps_res)
levels(dfp$mld_res) <- c("no", "yes")
levels(dfp$mld.ps_res) <- c("no", "yes")
head(dfp)


split_res <- clean_split_url(dfp$url)
lengths_res <- url_lengths(split_res)
ldl_res <- letter_digit_letter(split_res)
dld_res <- digit_letter_digit(split_res)
xyx_res <- combined_url_ambiguity(split_res)
ldsc_res <- lett_dig_symb_count(split_res)

split_res_2 <- clean_split_url(dfm$url)
lengths_res_2 <- url_lengths(split_res_2)
ldl_res_2 <- letter_digit_letter(split_res_2)
dld_res_2 <- digit_letter_digit(split_res_2)
xyx_res_2 <- combined_url_ambiguity(split_res_2)
ldsc_res_2 <- lett_dig_symb_count(split_res_2)


params_df <- as.data.frame(cbind(
  lengths_res,
  ldl_res,
  dld_res,
  xyx_res,
  ldsc_res
))
params_df_2 <- as.data.frame(cbind(
  lengths_res_2,
  ldl_res_2,
  dld_res_2,
  xyx_res_2,
  ldsc_res_2
))


params_df[, c("protocol", "protocol_l", "ldl_protocol", 
              "dld_protocol", "xyx_protocol", "lett_protocol", 
              "dig_protocol", "symb_protocol")] <- NULL

params_df_2[, c("protocol", "protocol_l", "ldl_protocol", 
                "dld_protocol", "xyx_protocol", "lett_protocol", 
                "dig_protocol", "symb_protocol")] <- NULL

fdfp <- cbind(dfp, params_df)
fdfm <- cbind(dfm, params_df_2)

cat("First DataFrame dimensions (dfdp): \n", dim(fdfp), 
    "\nSecond DataFrame dimensions (dfdm):\n", dim(fdfm), "\n")

cat(c(colnames(fdfp), "\n\n\n", colnames(fdfm)), sep = ", ")

fdfm[fdfm$label == "bad", "color"] <- '#6dd38c'
fdfm[fdfm$label == "good", "color"] <- '#f3aca7'

fdfp[fdfp$label == "bad", "color"] <- '#6dd38c'
fdfp[fdfp$label == "good", "color"] <- '#f3aca7'

data_distribution_df <- data.frame(counts = c(sum(fdfp$label == "good"), sum(fdfp$label == "bad")),
                                   labels = c("good", "bad"))
ggplot(data_distribution_df, aes(x = "", y = counts, fill = labels)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) + 
  theme_void() + ggtitle("Porównanie bezpieczeństwa domen w zbiorze danych \"PhishStorm\".") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12)) + 
  labs(fill = "Etykieta", color = "Etykieta")



data_distribution_df2 <- data.frame(counts = c(sum(fdfm$label == "good"), sum(fdfm$label == "bad")),
                                    labels = c("good", "bad"))
ggplot(data_distribution_df2, aes(x = "", y = counts, fill = labels)) +
  geom_bar(stat = "identity", width = 1, color = "white") +
  coord_polar("y", start = 0) + 
  theme_void() + 
  ggtitle("Porównanie bezpieczeństwa domen w poprzednio przygotowanym\nzbiorze danych \"Mendeley Data\".") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12)) + 
  labs(fill = "Etykieta", color = "Etykieta")


ggplot(fdfp[fdfp$url_l < 500, ], aes(x = label, y = url_l, group = label, fill = label)) + 
  geom_violin() +
  ylab("Długość linku") + 
  xlab("Etykieta") + 
  ggtitle("Porównanie długości adresów URL.") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        rect = element_rect(fill = "#d8d7c4"),
        #plot.background = element_rect(fill = "#d8d7c4"), 
        panel.background = element_rect(fill = "#f0bc5e", colour = "black")
  ) + 
  labs(color = "Etykieta")



splom(~data.frame(xyx_host, lett_host, dig_host, symb_host), 
      data = fdfp[sample(nrow(fdfp), 1000),],
      pch = 1,
      main = "Rozkład symboli w hoscie adresu URL.",
      groups = label,
      #       xlab = c("A", "B", "C", "D"),
      #       xlab = "", # czymś takim można usunąńć ten napis "Scatter Plot Matrix"
      #       ylab = c("A", "B", "C", "D"),
      pscales = 0,
      auto.key = list(columns = 2),
      varnames = c("Ilość ciągów\npostaci XYX", "Ilość liter", 
                   "Ilość cyfr", "Liczba znaków\ninterpunkcyjnych")
)

ggpairs(fdfp[fdfp$url_l < 500 & sample(nrow(fdfp), 1000), ], 
        aes(color = color,
            alpha = .5),
        columns = c("xyx_host", "lett_host", "dig_host", "symb_host"),
        columnLabels = c("Ilość ciągów\npostaci XYX", 
                         "Ilość liter", 
                         "Ilość cyfr",
                         "Liczba znaków\ninterpunkcyjnych")) +
  ggtitle("Rozkład symboli w hoscie adresu URL.") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        #panel.background = element_rect(fill = "#f0bc5e", colour = "black"),
        rect = element_rect(fill = "#d8d7c4")
  ) + 
  labs(color = "Etykieta")


histogram(~ symb_url  | label  , 
          data = fdfp[sample(nrow(fdfp), 2000),],
          main = "Porównanie ilości znaków interpunkcyjnych\nw dobrych i złych domenach.",
          xlab = "Ilość symboli w adresie URL",
          ylab = "Procent całości",
          layout = c(1, 2),
          nint = 20,
          xlim = c(0, 50)
)

ggplot(fdfp[fdfp$url_l < 500, ], aes(x = symb_url, fill = label)) + 
  geom_histogram(binwidth = 2, alpha = 0.6, position = 'identity') +
  ylab("Ilość wystąpień") + 
  xlab("Ilość symboli w adresie URL") + 
  ggtitle("Porównanie ilości znaków interpunkcyjnych\nw dobrych i złych domenach.") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        #panel.background = element_rect(fill = "#f0bc5e", colour = "black"),
        rect = element_rect(fill = "#d8d7c4")
  ) + 
  scale_fill_manual(values = c("#6dd38c", "#f3aca7")) +
  labs(fill = "Etykieta", color = "Etykieta")



ggplot(data = fdfm, aes(x = js_len, group = label, fill = label)) +
  geom_density(adjust = 1, alpha = .4) +
  ylab("Gęstość") +
  xlab("Długość kodu JavaScript") +
  ggtitle("Gęstość długości kodu JavaScript na stronach internetowych.") + 
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        #panel.background = element_rect(fill = "#f0bc5e", colour = "black"),
        rect = element_rect(fill = "#d8d7c4")
  ) + 
  scale_fill_manual(values = c("#f3aca7", "#6dd38c")) +
  labs(fill = "Etykieta", color = "Etykieta")



p <- ggplot(fdfp[fdfp$url_l < 1000, ], aes(x = xyx_query, y = xyx_url, color = label)) +
  geom_point(alpha = .7, na.rm = TRUE) + 
  theme(legend.position = "left") +
  ylab("Letter-Digit-Letter lub Digit-Letter-Digit w całym adresie URL") + 
  xlab("Letter-Digit-Letter lub Digit-Letter-Digit w zapytaniu") + 
  ggtitle("Porównanie podejrzanych ciągów w adresach URL.") +
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12)) + 
  labs(fill = "Etykieta", color = "label")

ggMarginal(p, type = "histogram")



splom(~data.frame(host_l, path_l, query_l, fragment_l, xyx_host, xyx_path, xyx_query), 
      data = fdfp[sample(nrow(fdfp), 2000),],
      pch = 1,
      main = "Rozkład znaków w domenach",
      groups = label,
      pscales = 0,
      auto.key = list(columns = 2),
      varnames = c("Długość\nhosta", "Długość\nścieżki", "Długość\nzapytania", 
                   "Długość\nfragmentu", "XYX\nhost", "XYX\nścieżka", 
                   "XYX\nzapytanie")
)



ggplot(data = fdfp[fdfp$url_l < 200, ], aes(x = symb_url, group = label, fill = label)) +
  geom_density(adjust = 5, alpha = .4) +
  ylab("Gęstość") + 
  xlab("Ilość znaków interpunkcyjnych w linku") + 
  ggtitle("Gęstość ilości znaków interpunkcyjnych w linkach") + 
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        #panel.background = element_rect(fill = "#f0bc5e", colour = "black"),
        rect = element_rect(fill = "#d8d7c4")
  ) + 
  scale_fill_manual(values = c("#6dd38c", "#f3aca7")) +
  labs(fill = "Etykieta", color = "Etykieta")



ggplot(data = fdfm, aes(x = js_len, y = js_obf_len, color = label) ) +
  geom_point() +
  ylab("Długość zaciemnionego kodu JavaScript.") + 
  xlab("Długość kodu JavaScript") + 
  ggtitle("Związek pomiędzy długością kodu JavaScript\na bezpieczeństwem domen")  + 
  theme(plot.title = element_text(family = "", 
                                  face = 'bold', 
                                  colour = 'black', 
                                  size = 12),
        #panel.background = element_rect(fill = "#f0bc5e", colour = "black"),
        rect = element_rect(fill = "#d8d7c4")
  ) + 
  scale_fill_manual(values = c("#6dd38c", "#f3aca7")) +
  labs(fill = "Etykieta", color = "Etykieta")


# ggsave(
#   "images/plot_8.png",
#   plot = last_plot(),
#   device = "png",
#   path = NULL,
#   scale = 1,  
#   #  width = 300,
#   #  height = 300,
#   #  units = "mm",
#   dpi = 400,
#   bg = "transparent"
# )


# 3D plot
par(mar = c(0,0,0,0))
plot3d( 
  x = fdfm$js_len, y = fdfm$js_obf_len, z = fdfm$url_len, 
  col = fdfm$color, 
  type = 's', 
  radius = 30,
  xlab = "JS", ylab = "JS obf ", zlab = "URL")
rgl.bg( sphere = FALSE, fogtype = "none", color = c("#d8d7c4", "black"), 
        back = "lines", fogScale = 1)

