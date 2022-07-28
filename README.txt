Le puoi scaricare con git

git clone git@github.com:AlSaqr-platform/ethernet.git

Poi ti servira' un programma per le gestioni delle depencies fatto dai ragazzi di zurigo. Puoi scaricarlo dove vuoi l'importate e' che poi lo aggiungi al path. Comunque come esempio puoi metterlo dentro la repo dell'axi:

cd ethernet
curl --proto '=https' --tlsv1.2 https://fabianschuiki.github.io/bender/init -sSf | sh -s -- 0.25.2

Poi lo aggiungi al path:

export PATH=$PWD:$PATH

A questo punto puoi lanciare lo script per compilare i file axi con modelsim:

./scripts/compile_vsim.sh

vsim eth_tb -t 1ns -coverage -voptargs="+acc +cover=bcesfx"
