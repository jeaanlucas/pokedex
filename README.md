# Pokedex
Uma pokedex para analisar seus pokemonzinhos :)

## Instalação

Antes de tudo, execute:

```
flutter pub get
```

e depois:

```
flutter pub run build_runner watch --delete-conflicting-outputs
```

## Ferramentas utilizadas

```
dio - Utilizado para fazer requests em API's

flutter_mobx - Utilizado para gerir o estado de toda a aplicação

flutter_modular - Utilizado para gerir as rotas e a injeção de dependência

image_picker - Lib utilizada para pegar imagens do device

material_design_icons_flutter - Lib utilizada para se obter ícones diversos

shared_preferences - Utilizado para acessar o armazenamento interno do device

uuid - Utilizado para criar um id para os dados salvos localmente

flutter_lints - Lints do Flutter para melhorar a qualidade do projeto

build_runner & mobx_codegen - Para gerar o código necessário para que a aplicação funcione
```

## Considerações

Foi utilizado Mobx ao invés de Bloc por eu gostar mais do mesmo.

Também foi requisitado a listagem dos pokemons ser do tipo de scroll infinito; Eu particularmente acho 
melhor a forma de navegação, então foi escolha própria a alteração.

Também foi solicitado que a foto do pokemon e os tipos estivessem na listagem juntamente com o nome, 
mas eu julguei que isso não seria performático, afinal, teria que fazer uma request para cada 
pokemon listado já que a rota de listagem principal não fornece essa informação. Julguei que isso 
tornaria o app lento ao startar e mudar a página na navegação.

## Dificuldades

Como eu comentei antes, achei que não seria interessante fazer a home como foi pedido. Seria algo não
performático e a cada next, demoraria um certo tempo até que tudo estivesse pronto para exibição.

Uma outra dificuldade que acabei tendo foi a de trabalhar com o image_picker. Eu nunca tinha utilizado
o plugin antes e tive que entender como ele funciona.

A escolha do mobx foi para evitar que eu demorasse de mais para finalizar o projeto. Faz algum tempo
desde que eu não trabalho com Bloc. Dessa forma, eu precisaria relembrar exatamente como ele era. Fiquei
com medo de não conseguir entregar todas as features caso isso me impedisse.