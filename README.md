# README

## Installation
1. Run `bundle install`
2. Run `rake db:create`
3. Run `rake db:migrate`
4. Run `rake db:seed`
5. Start a server `rails s`


## Description API 

### Регистрация

#### Запрос
```
POST "example.com:/api/v1/admin_users"
```

#### Параметры:
```
user[email] = example@gmail.com" string - почта нового пользователя
user[password] = "!@#123asdQWE" string - пароль нового пользователя
```

#### Успешный ответ
status: 200
```
{
    "user": {
        "id": 111,
        "email": "example@gmail.com"
    }
}
```
#### Ошибка
status: 422
```
{
    "email": [
        "error description"
    ]
}
```

### Логин

#### Запрос
```
POST "example.com:/api/v1/login"
```

#### Параметры:
```
user[email] = "example@gmail.com" string - почта нового пользователя
user[password] = "!@#123asdQWE" string - пароль нового пользователя
```

#### Успешный ответ
status: 200
```
{
	result: 'login success'
}
```

#### Ошибка
status: 422
```
{
	result: 'login fail'
}
```

### Добавление заметки

#### Запрос
```
POST "example.com:/api/v1/notes"
```

#### Параметры:
```
note[name] = "example@gmail.com" string - название заметки
note[time] = "2022-05-27T22:21:33" string - время напоминания
```

#### Успешный ответ
status: 200
```
{
    "note": {
        "name": "asd",
        "time": "2022-05-27T22:21:33.000Z",
        "description": null
    }
}
```

#### Ошибка
status: 422
```
{
    "time": [
        "reminder cannot be in the past tense"
    ]
}
```

