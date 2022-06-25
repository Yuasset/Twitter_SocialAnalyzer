install.packages("twitteR")
install.packages("ROAuth")
install.packages("tm")
install.packages("RCurl")
install.packages("tidyverse")
install.packages("lubridate")
library(twitteR)
library(ROAuth)
library(tm)
library(RCurl)
library(tidyverse)
library(lubridate)
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

api_key<-"pbpfKkwzsepPzVkCcCnps8v3h"
api_secret_key<-"GWmkj9BK4AP6ByCEjjJAjcAq1OruLHHYIrpZtv7BL1gvsxZD98"
access_token<-"1508868869435363341-R4TR7srau5QdNkSz65HASPiiTxpNox"
access_secret_token<-"hSwNfjmvnLwnylPD33bCmuLlvjXXyCQCSYSjhZ6c23yuj"

setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)

availableTrendLocations()%>%filter(country == "Turkey")

t<-getTrends(2344174)
head(t, 10)

tw<-searchTwitter("#JorgeOnTheStage", n=200)

em<-userTimeline("elonmusk")
df_em<-twListToDF(em)

elm<-getUser("elonmusk")

attributes(elm)
elm$created
elm$description
elm$favoritesCount
elm$followersCount
elm$followRequestSent
elm$friendsCount
elm$id
elm$lang
elm$lastStatus
elm$listedCount

elm$profileImageUrl
download.file("http://pbs.twimg.com/profile_images/1529956155937759233/Nyn1HZWF_normal.jpg", destfile = "picture")

elm$getFavorites(n=10)
elm$getFriends(n=5)
elm$getFollowerIDs(n=10)

df_user<-userTimeline("elonmusk")
df_1<-twListToDF(df_user)

df_1%>%
  select(text,favoriteCount)%>%
  arrange(desc(favoriteCount))%>%
  top_n(5)%>%
  View()

df_user<-userTimeline("GalatasaraySK", n=2000)
df<-twListToDF(df_user)

saat<-hour(df$created)

hist(saat, col = "red",
     xlab = "Saat araligi",
     ylab = "Tweet sayisi")



gun<-wday(df$created, label = F)

hist(gun, col = "red",
     xlab = "Gun",
     ylab = "Tweet sayisi")

gun<-wday(df$created, label = T)
ggplot(df,aes(gun)) +geom_bar()

year(df$created)

kaynaklar<-df$statusSource

kaynaklar2<-gsub("</a>","",kaynaklar)

kaynaklar3<-strsplit(kaynaklar2,">")

kaynaklar4<-sapply(kaynaklar3, function(x) x[2])

table(kaynaklar4)

kaynak_tablosu<-table(kaynaklar4)

kaynak_tablosu

pie(kaynak_tablosu)



