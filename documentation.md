# Documentación del Proyecto

## Tabla de Contenidos
- [Documentación del Proyecto](#documentación-del-proyecto)
  - [Tabla de Contenidos](#tabla-de-contenidos)
  - [Introducción](#introducción)
  - [Exploración de Datos](#exploración-de-datos)
  - [Preparación de Datos](#preparación-de-datos)
  - [Modelos](#modelos)
    - [Clasico](#clasico)
    - [Deep Learning](#deep-learning)
  - [Elección de Modelo](#elección-de-modelo)
  - [Despliegue](#despliegue)
  - [Monitoreo](#monitoreo)
  - [Posibles mejoras](#posibles-mejoras)
    - [Datos](#datos)
    - [Modelos](#modelos-1)
    - [Despliegue](#despliegue-1)

## Introducción

El objetivo de este archivo es clarificar el proceso de desarrollo del proyecto, así como proporcionar comentario sobre las decisiones tomadas durante el proceso de desarrollo.

## Exploración de Datos

El proceso de exploración de datos se llevó a cabo en el cuaderno [data-exploration.ipynb](#notebooks/data-exploration.ipynb). Este cuaderno contiene el código utilizado para explorar los datos, incluyendo la visualización de las características y la identificación de valores atípicos. Los principales descubrimientos en este cuaderno son los siguientes:

- Los datos se centran en el año 2017, con un pequeño número de datos de 2018.
- Vlo-I y Vlo-O son practicamente identicos.
- Des-I y Des-O son practicamente identicos.
- Emp-I y Emp-O son iguales solo un 72% del tiempo.
- Hay una mayor cantidad de vuelos atrasados que no atrasados.
- Tanto 'SIGLAORI', 'Ori-O' y 'Ori-I' son irrelevantes ya que son valores constantes que se refieren al aeropuerto de santiago que estamos analizando.

Luego de la etapa de exploración de datos, se llego a __asumir__ lo siguiente:

- Los atrasos de entre 0 y 15 minutos se consideran como atrasos, dado a pesar de ser menores en vuelo con multiples escalas pueden afectar a los pasajeros.

## Preparación de Datos

Se utilizó el cuaderno [data-preparation.ipynb](#notebooks/data-preparation.ipynb) para preparar los datos para el entrenamiento del modelo. Este cuaderno contiene el código utilizado para preparar los datos, incluyendo la codificación de las características y la división de los datos en conjuntos de entrenamiento y prueba. Los principales cambios realizados en este cuaderno son los siguientes:

- Se eliminaron las colunas 'SIGLAORI', 'Ori-O' y 'Ori-I' ya que son irrelevantes.
- Se eliminaron las columnas Vlo-O y Des-O ya que son practicamente identicas a Vlo-I y Des-I.
- Se eliminaron las columnas 'Fecha-O', 'Emp-O', 'DIA', 'MES','AÑO', ya que contienen informacion que se __asume__ que se obtiene despues de la llegada del vuelo.
- Se eliminaron las columnas 'Diferencia en minutos','Atraso menor' ya que contienen informacion que se __asume__ que se obtiene despues de la llegada del vuelo y debido a su irrelevancia respectivamente, pero pero si fueron utilizados para etiquetar los datos.
- Se codificaron los datos utilizando tecnicas de codificacion para datos categoricos, para mas informacion ver el notebook [data-preparation.ipynb](#notebooks/data-preparation.ipynb) en seccion codificacion de variables categoricas.
- El set de entrenamiento y test se conforma de un 80% y 20% respectivamente.
- El desbalance de clases se soluciono utilizando la tecnica de submuestreo aleatorio, para mas informacion ver el notebook [data-preparation.ipynb](#notebooks/data-preparation.ipynb) en seccion set de entrenamineto y prueba.

## Modelos

En este proyecto se utilizaron modelos de dos tipos, clasico y de aprendizaje profundo. Los modelos clasicos utilizados fueron:

### Clasico

- Xgboost: Este es un modelo de arboles de decision que utiliza el algoritmo de boosting para mejorar el rendimiento de los arboles de decision. Es popular debido a su rendimiento y velocidad.

### Deep Learning

- DNN: Este es un modelo de redes neuronales profundas, que utiliza capas densas para aprender las relaciones entre las caracteristicas de los datos. Es popular debido a su rendimiento y versatilidad.
- LSTM: Este es un modelo de redes neuronales recurrentes, que utiliza capas LSTM para aprender las relaciones entre las caracteristicas de los datos, su uso principal es para prediccion de series de tiempo, pero combinado con redes neuronales profundas puede ser utilizado para clasificacion.
- CNN: Este es un modelo de redes neuronales convolucionales, que utiliza capas convolucionales para extraer caracteristicas de los datos, su uso principal es para clasificacion de imagenes, pero combinado con redes neuronales profundas puede ser utilizado para clasificacion de datos estructurados.

El desempleño de los modelos se evaluo utilizando las metricas de precision, recall y f1-score, para mas informacion de entrenamiento puede encontrar los logs de tensorboard en la carpeta [logs](#logs).

## Elección de Modelo

El modelo que fue elegido esta basado en redes neuronales profundas (DNN), utilizando la libreria Tensorflow de deep learning. Este modelo fue elegido debido a su desempleño en las metricas de precision, recall y f1-score que se pueden ver en la siguiente tabla comparativa:

| Modelo | Accuracy | Recall | F1-Score |
| ------ | --------- | ------ | -------- |
| Xgboost | 0.66 | 0.66 | 0.77 |
| DNN | 0.77 | 0.84 | 0.86 |

## Despliegue

Una de las ventajas de utilizar tensorflow como libraria de deep learning es que permite exportar el modelo entrenado a un formato estandarizado llamado [SavedModel](https://www.tensorflow.org/guide/saved_model), este formato permite que el modelo pueda ser utilizado en diferentes lenguajes de programacion y diferentes plataformas. En este proyecto se utilizo el lenguaje de programacion python para exportar el modelo.

Una vez exportado podemos utilizar este modelo dentro de otro de los servicios de Google Tensorflow serving, este servicio permite desplegar el modelo en un servidor y exponerlo como un servicio web, para que pueda ser utilizado por otras aplicaciones.

En este caso se utilizo un servicio de kubernetes llamado Minikube, este servicio permite desplegar un cluster de kubernetes en una maquina local para facilitar la reproduccion del proyecto, sin comprometer la escalabilidad y compatibilidad del sistema, ya que este servicio es compatible con cualquier servicio de kubernetes, como por ejemplo Google Kubernetes Engine (GKE).



## Monitoreo

Creo firmemente que una de las partes mas importantes de un proyecto de machine learning es el monitoreo, ya que permite detectar problemas no solo relacionados al modelo, sino que tambien relacionados al despliegue y salud de la API. Tensorflow Serve permite monitorear el estado del modelo y de la API a traves de Prometheus, una herramienta de monitoreo de codigo abierto, que permite visualizar el estado de los servicios de kubernetes.

Monitorear viene de la mano siempre de accesibilidad al monitoreo, esa es la razon por la cual se utilizo Grafana, una herramienta de visualizacion de datos de codigo abierto, que permite visualizar los datos de Prometheus de una manera mas amigable.

## Posibles mejoras

Existe una gran cantidad de mejoras que se pueden realizar a este proyecto, a continuacion se listan algunas de ellas que no fueron implementadas para mantener el alcance del proyecto:

### Datos

- Utilizar datos fuera de de los datos originalmente entregados, como por ejemplo datos de clima, datos de trafico, etc.
- Utilizar distintas tanto de codificacion, como de normalizacion y balanceo de datos.

### Modelos

- Expandir en la arquitectura del modelo, debido a la facilidad de integracion de tensorflow con el servicio de despliegue, se puede buscar arquitecturas mas complejas y con mejores resultados.

### Despliegue

- Optimizar el binario, al compilar un modelo hay varias maneras de hacerlo y si bien tensorlfow soporta metodos de estado del arte, el metodo por defecto se enfoca en compatibilidad y no en optimizacion.
- Utilizar acceleradores como GPU y TPU, para mejorar la velocidad de inferencia del modelo.
- gRPC vs REST, tensorflow soporta ambos protocolos, pero gRPC es mas rapido y eficiente que REST, por lo que se podria utilizar para mejorar la velocidad de inferencia del modelo.
- Batching, tensorflow soporta batching, que permite procesar multiples peticiones en una sola, mejorando la velocidad de inferencia del modelo.
- Model warmup, tensorflow soporta warmup, que permite cargar el modelo en memoria antes de recibir peticiones, mejorando la velocidad de inferencia del modelo.
- XLA, tensorflow soporta XLA, que permite compilar el modelo en tiempo de ejecucion, mejorando la velocidad de inferencia del modelo.
- Utilizar un servicio de kubernetes en la nube, como por ejemplo Google Kubernetes Engine (GKE), para mejorar la escalabilidad del sistema.

Estos son solo algunas de las mejoras que se pueden realizar, pero existen muchas mas.