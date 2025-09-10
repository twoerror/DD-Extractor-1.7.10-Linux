#!/bin/bash

if [ -f mod/*.jar ]; then
    mv mod/*.jar data/mod.jar
else
    echo "ERROR: No .jar files found in mod/"
    exit 1
fi

mkdir -p "$HOME/.gradle/caches/minecraft/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10"
rsync -a "forge/" "$HOME/.gradle/caches/minecraft/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/"

java -jar data/deobfuscator.jar --inputJar mod/*.jar --outputJar "data/mod.jar" --mappingsVer "1.7.10-10.13.4.1614-1.7.10-shipped"
java -jar data/decompilator.jar "data/mod.jar" --outputdir source/
