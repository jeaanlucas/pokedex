#!/bin/bash

# Verifica se possuí o Flutter instalado
if ! command -v flutter &> /dev/null
then
    echo "Flutter não está instalado, acesse https://docs.flutter.dev/get-started/install e siga as instruções"
    exit
fi

path=`pwd`

# Removendo os arquivos g.dart
find $path/modules/custom_pokemomns -name "*.g.dart" -type f -delete
find $path/modules/original_pokemons -name "*.g.dart" -type f -delete

# Executa os comandos do Flutter necessários dentro dos módulos
cd $path/modules/commons_dependencies
flutter clean
flutter pub get

cd $path/modules/custom_pokemomns
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

cd $path/modules/home_pokemons
flutter clean
flutter pub get

cd $path/modules/original_pokemons
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs

# Executa os comandos do Flutter necessários dentro da raiz
cd $path
flutter clean
flutter pub get