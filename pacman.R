pacman::p_load(pacman, dplyr, GGally, ggplot2, ggthemes, ggvis, VIM, lubridate, plotly, rio, 
               rmarkdown, shiny, stringr, tidyr, openxlsx, RColorBrewer, ggrepel, showtext, extrafont,
               tidyverse, data.table, vroom, devtools, scales, knitr, naniar)

# vroom : 파일 읽기 

# 열별 결측치 비율

check_missing_value <- function(x){sum(is.na(x))/length(x)*100}
apply(자료명, 2, check_missing_value)

miss_var_summary(자료명)
miss_case_summary(자료명)

# 결측치 비율 시각화 
sapply(data, function(x) length(unique(x))) 

missing_values <- data %>% summarize_all(funs(sum(is.na(.))/n()))
missing_values <- gather(missing_values, key = "feature", value = "missing_pct")
missing_values %>% 
    ggplot(aes(x = reorder(feature,-missing_pct), y = missing_pct)) +
    geom_bar(stat = "identity", fill = "red")+
    coord_flip() + theme_bw()

# 그룹별 na 세기
na.count=apply(자료명, 2, function(x) sum(is.na(x)))
na.count[na.count>0]

#NA 그래프 
aggr(자료명, prop = FALSE, numbers = TRUE)
md.pattern(자료명)

# Unique values per column
lapply(data, function(x) length(unique(x))) 

# 결측치 원하는 값으로 바꾸기
자료$컬럼명 <- replace(자료$컬럼명, which(is.na(자료$컬럼명)), '바꿀 값')

# 컬럼 클래스 변경하기
cname <- c("A", "B","C","D")
DF[ , cname ] <- lapply (DF[ , cname ], as.numeric)

# 구성비 그래프

p <- ggplot(data = gss_sm,
            mapping = aes(x = bigregion))
p + geom_bar(mapping = aes(y = ..prop.., group = 1)) 

fonts()

# 밑줄 슬래시 날리기
gsub("[/_//]", "", colnames(df))

# contains

bar <- train %>% 
  select(-contains("id"))
  
# mutate_all

tbl_mosaic <- full %>%
  filter(set=="train") %>%
  select(Survived, Pclass, Sex, AgeGroup=`Age Group`, title, Embarked, `FamilySize`) %>%
  mutate_all(as.factor)




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

# 라벨 내용 조정
graph +
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

+ labs( x = "x축 제목",
        y = "y축 제목",
        title = "제목",
        subtitle = "부제목",
        caption = "출처 등")

scale_x_continuous(breaks = c(10,20,30,40,50,60), labels = scale::)

scale_color_brewer(palette = "")

scale_x_log10()


# 폰트 

font_import(pattern = 'Myriad')
fonttable()