# Poke_dex
Uma pokedex para analisar seus pokemonzinhos

## Instalação

Antes de tudo, execute:
```
flutter pub get
```

e depois:

```
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Considerações

Foi utilizado Mobx ao invés de Bloc por eu gostar mais do mesmo.

Também foi requisitado a listagem dos pokemons ser do tipo de scroll infinito; Eu particularmente acho 
melhor a forma de navegação, então foi escolha própria a alteração.

Também foi solicitado que a foto do pokemon e os tipos estivessem na listagem juntamente com o nome, 
mas eu julguei que isso não seria performático, afinal, teria que fazer uma request para cada 
pokemon listado já que a rota de listagem principal não fornece essa informação. Julguei que isso 
tornaria o app lento ao startar e mudar a página na navegação.