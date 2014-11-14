datamos
=======


Пакет `datamos` предназначен для скачивания наборов данны с [data.mos.ru](http://data.mos.ru/). Пакет можно установить командами:
```r
install.packages("devtools")
library("devtools")
install_github("bdemeshev/datamos")
```

Можно получить список всех доступных наборов данных
```r
dsets <- datamos_list()
head(dsets)
```

И скачать конкретный набор данных по `id`:
```r
df <- datamos(654)
```

Метаданные о рядах сохраняются в атрибутах `info_df` и `info_vars`. Их можно увидеть с помощью команд:
```r
df <- datamos(654)
attr(df,"info_df")
attr(df,"info_vars")
```

Комментарии:
* неплохо бы добавить автоматическое распознавание для чисел
* неплохо бы добавить распознавалку широты/долготы 
* судя по сайту нужен ключ к api, но пока всё и так работает на малых объёмах

### English translation:


The package `datamos` allows to download datasets from [data.mos.ru](http://data.mos.ru/). The package may be installed via:
```r
install.packages("devtools")
library("devtools")
install_github("bdemeshev/datamos")
```

One may obtain the list of all available datasets.
```r
dsets <- datamos_list()
head(dsets)
```

It is possible to download a specific dataset by `id`:
```r
df <- datamos(654)
```

Metadata is saved in `info_df` and `info_vars` attributes. One may look at metadata using commands:
```r
df <- datamos(654)
attr(df,"info_df")
attr(df,"info_vars")
```

Comments:
* automatically recognise numeric variables
* automatically recognise latitude/longitude and mark them somehow 
* maybe api key is needed for bulk downloads
