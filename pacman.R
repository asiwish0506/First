pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate, plotly, rio, 
               rmarkdown, shiny, stringr, tidyr, openxlsx, RColorBrewer, ggrepel, showtext, extrafont,
               tidyverse, data.table, vroom, devtools)

# vroom : 파일 읽기 


font_import(pattern = 'MyLOTTE')
fonttable()


data <- data.frame(
  x = c(1, 2, 1, 2, 1.5),
  y = c(1, 1, 2, 2, 1.5),
  text = c("좌측하단", "우측하단", "좌측상단", "우측상단", "가운데")
)
  
theme_update(text = element_text(family="NanumSquareRound Regular"))

ggplot(data=data, aes(x, y)) +
  geom_text(aes(label = text), vjust="inward", hjust="inward",
            family="NanumGothic") +
  ggtitle('예제의 제목 - HUJingo340 기본 폰트',
          '예제의 소제목 - 변경: HUIncludemyunjo140') +
  theme(plot.subtitle=element_text(family="NanumGothic")) 




