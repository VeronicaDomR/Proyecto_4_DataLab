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

- *Acciones realizadas:* 
    - Eliminación de duplicados de product_id: Se filtraron los registros para excluir aquellos con about_product nulo. Luego, se eliminaron los duplicados de product_id, conservando una única instancia para cada uno. Como resultado, se obtuvieron un total de 1,351 registros únicos.
    - Variables que se mantuvieron con valores no únicos: A continuación se detallan las variables que no se consideran únicas y que pueden tener múltiples valores por product_id: about_product, discount_percentage, actual_price, category, product_name, discounted_price.

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

En las columnas review_title y review_id, identificamos 144 valores únicos que originalmente estaban duplicados. Sin embargo, estos valores aparecen duplicados múltiples veces, resultando en un total de 415 duplicados en el dataset. 
Por otro lado, en la columna review_content, identificamos 141 valores únicos que originalmente estaban duplicados. Estos valores también aparecen duplicados múltiples veces, resultando en un total de 394 duplicados en el dataset.

Se analizan las variables para determinar cuales duplicados podrian ser considerados importantes:

- *review_id:* Este identificador debería ser único para cada reseña. Duplicados en este campo podrían indicar un problema serio en la integridad de los datos, como la inserción repetida de registros.
- *product_id:* Este campo identifica de manera única a un producto. Si bien un producto puede tener muchas reseñas, la duplicación de product_id en combinación con otros campos podría sugerir que se han repetido registros de productos, lo que podría causar problemas al analizar la cantidad de productos únicos.
- *review_title y review_content:* Estos campos contienen el contenido textual de las reseñas. Duplicados aquí podrían indicar que los usuarios están publicando reseñas repetidas, lo que podría considerarse como spam o contenido duplicado.

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