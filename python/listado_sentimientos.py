pip install textblob vaderSentiment pandas

import pandas as pd

# Cargar el dataset desde un archivo CSV
df = pd.read_csv('/content/dataset.csv')

# Mostrar las primeras filas del dataset
print(df.head())

import nltk

# Descargar el paquete 'punkt' necesario para tokenización
nltk.download('punkt')

# Descargar el paquete 'averaged_perceptron_tagger' necesario para POS tagging
nltk.download('averaged_perceptron_tagger')
from textblob import TextBlob

# Función para extraer palabras positivas y negativas
def extract_words(content):
    blob = TextBlob(content)
    positive_words = []
    negative_words = []
    
    for word, pos in blob.tags:
        if pos.startswith('JJ'):  # Verifica si es un adjetivo
            polarity = TextBlob(word).sentiment.polarity
            if polarity > 0:
                positive_words.append(word)
            elif polarity < 0:
                negative_words.append(word)
    
    return positive_words, negative_words

# Aplicar la función al dataset
df['positive_words'] = df['cleaned_review_content'].apply(lambda x: extract_words(x)[0])
df['negative_words'] = df['cleaned_review_content'].apply(lambda x: extract_words(x)[1])

# Mostrar el resultado
print(df[['review_title', 'cleaned_review_content', 'positive_words', 'negative_words']])