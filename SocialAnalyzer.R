install.packages("igraph")
library(igraph)
install.packages("visNetwork")
library(visNetwork)
install.packages("igraphdata")
library(igraphdata)

#make_empty_graph() - Boş yönlü düğüm oluşturmak için kullanılır
#make_empty_graph(directed=F) - Boş yönsüz düğüm oluşturmak için kullanılır 

g<-make_empty_graph(directed=F)

#vertices() - Düğüm eklemek için kullanırım ("1.Düğüm","2.Düğüm","3.Düğüm")
g<-g + vertices("Ali","Ayse","Fatma","Yusa","Irem","Serdar")

#plot(g) - Düğümü ekranda görsel olarak göster
plot(g)

#edges("1.Düğüm","1.Düğümün Komşusu","2.Düğüm","2.Düğümün Komşusu") - Düğümler arasında yol/bağlantı oluşturmak.
g<-g+edges("Irem","Serdar","Irem","Ali","Ali","Fatma","Yusa","Fatma","Ayse","Serdar","Ali","Ayse","Fatma","Serdar")
plot(g)

g<-g+edge("Ali","Fatma")+edge("Irem","Ayse")
plot(g)

#degree(g) - Düğümlerin derecelerini gösterir.
degree(g)
degree(g, "Fatma")
degree(g, c("Fatma","Serdar"))

#neigbors(g, "1.Düğüm") - ilgili düğümün hangi düğümlerle komşu olduğunu göster.
neighbors(g, "Fatma")

#are_adjacent(g,"1.Düğüm","2.Düğüm") - Komşular mı?
are_adjacent(g, "Irem","Serdar")
are_adjacent(g, "Irem","Fatma")


#is.directed(g) - İlgili düğüm türü yönlü yapıda mı?
is.directed(g)

#as.directed(g, mode="mutual") - düğümü yönlü bağlantı türüne çevir: mode="mutual"
g1<-as.directed(g, mode="mutual")
plot(g1)

#delete.edges(g1, c("Ayse|Serdar","Ali|Fatma","Irem|Ali")) - Komşu düğümlerindeki bağlantıları kaldırmak
g1<-delete.edges(g1, c("Ayse|Serdar","Ali|Fatma","Irem|Ali"))
plot(g1)


degree(g1)
#degree(g1, mode="in") - talepde bulunan düğüm derecelerini göster
degree(g1, mode="in")
#degree(g1, mode="out") - Düğüme gelen istekleri göster
degree(g1, mode="out")

g2<-graph(c(1,2)) # Düğüm oluştur 
plot(g2,
     vertex.color="red", 
     vertex.size=50,
     edge.color="green")
# Vertex.color = Düğümü renklendir.
# Vertex.size = Düğümün boyutunu ayarla.
# edge.color = Düğümler arası yolları renklendir.

g3<-graph(c(1,2,2,3,3,4,4,1))
plot(g3, 
     vertex.color="red",
     vertex.size=50,
     edge.color="green")

g4<-graph(c(1,2,2,3,3,4,4,1), directed = F)
plot(g4,
     vertex.color="red",
     vertex.size=50,
     edge.color="green")

# graph(n=6) - Toplam 6 düğüm oluştur
g5<-graph(c(1,2,2,3,3,4,4,1), directed = F, n=6)
plot(g5,
     vertex.color="red",
     vertex.size=50,
     edge.color="green")

g5[] #Matris olarak dugumlerin hangi dugumler ile komsu oldugunu gosterir

g6<-graph(c("Ali","Veli","Veli","Ayse","Ayse","Ali","Ali","Ayse","Fatma","Ayse"))
plot(g6,
     vertex.size=60,
     vertex.color="grey",
     edge.color="brown")
g6

g7<-graph(c("Ali","Veli","Veli","Ayse","Ayse","Ali","Ali","Ayse","Fatma","Ayse"),directed=F)
plot(g7)
g7

degree(g6) 
degree(g6, mode = "in") #Düğüme gelen istekleri göster
degree(g6, mode = "out") #Düğümden çıkan istekler göster

diameter(g6,directed = F,weights = NA)

#edge_density(g6) - Ortalama aralıkları
edge_density(g6)
edge_density(g7)

#Yonlu Agda = N*(N-1)
#Yonsuz Agda = (N*(N-1))/2

ecount(g6) #Toplam bağlantı sayısı
vcount(g6) #Toplam düğüm sayısı

ecount(g6)/(vcount(g6)*(vcount(g6)-1))
