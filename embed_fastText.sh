# Create word embeddings for corpora 1, 2 and 3 using fastText.

if ls embeddings/fastText > /dev/null 2>&1 
then
    echo "fastText found."
else
    git clone https://github.com/facebookresearch/fastText.git
    mv fastText/ embeddings/
    cd embeddings/fastText/
    make
    cd ../../
fi

./embeddings/fastText/fasttext cbow -input data/corpus1/total/total.txt \
    -output fastText.corpus1.300d -dim 300 -minCount 1 -epoch 100
./embeddings/fastText/fasttext cbow -input data/corpus2/total/total.txt \
    -output fastText.corpus2.300d -dim 300 -minCount 1 -epoch 100
./embeddings/fastText/fasttext cbow -input data/corpus3/total/total.txt \
    -output fastText.corpus3.300d -dim 300 -minCount 1 -epoch 100