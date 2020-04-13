pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, httr, lubridate, plotly, rio, 
               rmarkdown, shiny, stringr, tidyr, openxlsx, RColorBrewer, ggrepel, showtext, extrafont,
               tidyverse, data.table, vroom, devtools, scales)

# vroom : 파일 읽기 

font_import(pattern = 'MyLOTTE')
fonttable()


# ggplot 테마 및 폰트 

data <- data.frame(
  x = c(1, 2, 1, 2, 1.5),
  y = c(1, 1, 2, 2, 1.5),
  text = c("좌측하단", "우측하단", "좌측상단", "우측상단", "가운데")
)

theme_update(text = element_text(family = "NanumSquareRound Regular"))

ggplot(data=data, aes(x, y)) +
  geom_text(aes(label = text), vjust="inward", hjust="inward",
            family="NanumSquareRound Regular") +
  ggtitle('예제의 제목 - HUJingo340 기본 폰트',
          '예제의 소제목 - 변경: HUIncludemyunjo140') +
  theme(plot.subtitle=element_text(family="NanumSquareRound Regular")) 



# 결측치 비율 시각화 
sapply(data, function(x) length(unique(x))) 

missing_values <- data %>% summarize_all(funs(sum(is.na(.))/n()))
missing_values <- gather(missing_values, key = "feature", value = "missing_pct")
missing_values %>% 
    ggplot(aes(x = reorder(feature,-missing_pct), y = missing_pct)) +
    geom_bar(stat = "identity", fill = "red")+
    coord_flip() + theme_bw()

# 라벨 내용 조정
graph + xlab("X축 제목") +
  ylab("Y축 제목") +
  theme(axis.title.x=element_text(family="NanumGothic",  # 글꼴이름
                                  face="bold",           # "bold" or "italic"
                                  hjust=1,               # 0=왼쪽정렬, 0.5=중앙정렬, 1=우측정렬
                                  size=20,               # 글자 크기
                                  color="purple",        # 글자 색상
                                  angle=0),              # 글자 회전 (0~360)
        axis.title.y=element_text(family="NanumGothic",
                                  face="bold",
                                  vjust=1,               # 0=하단정렬, 0.5=중앙정렬, 1=상단정렬
                                  size=20,
                                  color="darkblue",
                                  angle=0))
        axis.text.x
        axis.text.y
        xlab("X축 제목")
        ylab("Y축 제목")

scale_x_continuous(breaks = c(10,20,30,40,50,60), labels = scale::)

scale_color_brewer(palette = "")

# Unique values per column
lapply(data, function(x) length(unique(x))) 

# 결측치 원하는 값으로 바꾸기
full$Embarked <- replace(full$Embarked, which(is.na(full$Embarked)), 'S')

# 컬럼 클래스 변경하기
cname <- c("A", "B","C","D")
DF[ , cname ] <- lapply (DF[ , cname ], as.numeric)
