# Proyecto 4 DataLab

![alt text](images/amazon-828x548.jpg)

## Temas

- [Objetivo](#objetivo)
- [Herramientas](#herramientas)
- [Lenguajes](#lenguajes)
- [Resultados](#resultados)
- [Conclusiones y recomendaciones](#conclusiones-y-recomendaciones)
- [Recursos](#recursos)

## Objetivo
El objetivo de este análisis es entender las tendencias y patrones en las calificaciones y reseñas de productos disponibles en Amazon, con el fin de proporcionar insights que puedan ayudar a mejorar la satisfacción del cliente.


## Herramientas

## Lenguajes

## Procesamiento y preparación de datos

### Importación y Creación de Tablas en BigQuery

- ID proyecto: Proyecto4datalab.
- Tablas importadas:
    - amazon_product
    - amazon_review
### Identificación y Manejo de Valores Nulos

-  *Tabla: amazon_product*
  - about_product: 4 nulls.

 ![alt text](images/image.png)

 - *Acciones realizadas:* Se optó por eliminar estos registros dado que ya se contaba con un product_id duplicado.

![alt text](images/duplicates_about_product.png)
 
   - *Tabla: amazon_review*
  - img_link: 466 nulls.
  - product_link: 466 nulls.
  - rating_count: 2 nulls.

- *Acciones realizadas:* 
    - Valores nulos en img_link y product_link: Se decidió mantener los valores nulos en estas columnas ya que no son variables críticas para el análisis.
    - Imputación de valores en rating_count: Se calcularon las medias de rating_count basadas en los valores de rating. Para el rating de 5, la media fue de 14, mientras que para el rating de 3, la media fue de 467. Estos valores fueron utilizados para imputar los nulos en rating_count.

### Identificación y Manejo de Valores Duplicados

-  *Tabla: amazon_product*
    - about_product: 130
    - discount_percentage: 89 
    - actual_price: 190
    - category: 136
    - product_name: 102
    - product_id: 96
    - discounted_price: 1870

En la columna product_id, se identificaron 96 valores únicos que originalmente estaban duplicados. Sin embargo, estos valores aparecen duplicados múltiples veces, resultando en un total de 214 duplicados en el dataset. Esto significa que hay 118 duplicados adicionales que no fueron contabilizados inicialmente.

-  *Tabla: amazon_review*   
    - user_id:144
    - user_name: 144
    - review_title: 144 originales (271 omitidos)
    - review_id: 144 originales (271 omitidos)
    - review_content: 141 originales (253 omitidos)
    - img_link: 49
    - product_link: 1
    - product_id: 92
    - rating: 21
    - rating_count: 204 

- *Acciones realizadas:* 
    - Eliminación de duplicados de product_id: Se filtraron los registros para excluir aquellos con about_product nulo. Luego, se eliminaron los duplicados de product_id, conservando una única instancia para cada uno. Como resultado, se obtuvieron un total de 1,351 registros únicos.
    - Variables que se mantuvieron con valores no únicos: A continuación se detallan las variables que no se consideran únicas y que pueden tener múltiples valores por product_id: about_product, discount_percentage, actual_price, category, product_name, discounted_price.

- amazon_review nulos final

 ![alt text](images/review_nulls_final.png)

- amazon_review duplicados final

 ![alt text](images/review_duplicates_final.png)


- amazon_product nulos final

 ![alt text](images/product_nulls_final.png)


- amazon_product duplicados final

 ![alt text](images/product_duplicates_final.png)

### Identificación y manejo de datos fuera del alcance del análisis
-  *Tabla: amazon_product*  
Se llevó a cabo una verificación de la consistencia y coherencia de los precios y descuentos registrados en la tabla amazon_product, con el objetivo de identificar y corregir posibles errores en los datos antes de realizar análisis más profundos o tomar decisiones informadas. Esta validación garantiza que los precios y descuentos reflejen con precisión la realidad del producto, preservando la integridad y confiabilidad de los datos.
Se encontraron 27 product_id, que presentan algún tipo de inconsistencia entre discounted_price, actual_price y discount_percentage
-  *Tabla: amazon_review*  

En el proceso de limpieza y transformación se comenzó pdividió la categoría de los productos en varias columnas para facilitar su análisis. También se limpió la columna que describe los productos eliminando caracteres no deseados, como emojis, paréntesis y espacios innecesarios, asegurando que el texto quedara libre de ruido.

Adicionalmente, se analizó la columna de identificadores de usuarios, contando cuántos ID estaban presentes en cada registro. Las reseñas también fueron limpiadas de signos, emojis y otros caracteres no alfabéticos, dejando solo el texto relevante para el análisis. Estas transformaciones permiten trabajar con un conjunto de datos más estructurado y limpio, adecuado para análisis posteriores y generación de insights. Concluyendo en una sola tabla que se llama datset

![alt text](images/dataset.png)

Se realizó un script en Python para analizar datos de texto y extraer listas de palabras positivas y negativas a partir de las variables review_title y cleaned_review_content. Utilizando la biblioteca TextBlob, el script identifica y clasifica adjetivos según su polaridad de sentimiento. [Revisar el script](python/listado_sentimientos.py).
