# Викторина

Консольное приложение "Викторина"

# Скриншоты

![Игра закончена](https://i.imgur.com/XHnO8s2.png)

# Правила

* Нужно ответить на 5 вопросов
* У каждого вопроса есть своё время на ответ
* За правильный ответ даются баллы


# Как запустить

```
git clone git@github.com:sirdemin/quiz.git
cd quiz
ruby main.rb
```

# Работа с вопросами

Данные находятся в `data/questions.xml`

Формат отдельного вопроса:

```xml
<question seconds="XXX" points="XXX">
  <text>Вопрос</text>
  <variants>
    <variant>Ответ</variant>
    <variant>Ответ</variant>
    <variant right="true">Правильный ответ</variant>
    <variant>Ответ</variant>
  </variants>
</question>
```

# Версия

**ruby 2.7.2**

# Автор

[Илья Д.](https://github.com/sirdemin)

© 2021
