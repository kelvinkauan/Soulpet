# soulpet


## API ##

## API - Autenticação ## 
### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/login  ###
##### Função: Efetua o login do usuário e obtem o access_token #####
####Enviar:
```json
{  
    "email": "desenvolvimento@7cliques.com.br", 
    "password": "cli007" 
}
```

####Retorna:
```json
{
    "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC90cmVra2Vycy5zZXZlbmNsaWNrcy51c1wvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU3MTg1MzMyMywiZXhwIjoxNTcxODU2OTIzLCJuYmYiOjE1NzE4NTMzMjMsImp0aSI6ImgxSG96dVRtWTdpU2lubmUiLCJzdWIiOjMsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjciLCJuYW1lIjoiTW9hY3lyIiwiZW1haWwiOiJtb2FjeXJicml0b3NpQGdtYWlsLmNvbSJ9.do4zj6cpXsiIBiVsS4uH61qGEyUkMux4_OFDx_KKTGM",
    "token_type": "bearer",
    "expires_in": 360000,
    "user": {
        "id": 3,
        "name": "Moacyr",
        "avatar": "https://ca.slack-edge.com/T052GGEFZ-U7VDD43D1-2b7459f15d67-48",
        "email": "moacyrbritosi@gmail.com",
        "role": "admin"
    }
}
```

####Se der erro, retorna:

```json
{
    "error": "Unauthorized"
}
```


### Login com facebook ###
### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/loginfacebook  ###
```json
{  
    "Pedente ainda nao está pronta"
}
```

### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/logout  ###
##### Função: terminará a sessão de acesso do usuário ao sistema. #####
```json
Passar no headers o access_token
headers = Authorization: Bearer <token>
```
####Retorna:
![](/imagesReadme/logout.png)


### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/refresh  ###
##### Função: Gera um novo access_token. #####
```json
Passa no headers o access_token
headers = Authorization: Bearer <token>
```
####Retorna:
![](/imagesReadme/refresh.png)

### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/me  ###
##### Função: Retorna dados do usuário logado. #####
```json
Passar no headers o access_token
headers = Authorization: Bearer <token>
retorna os dados do usuário
```
####Retorna:
![](/imagesReadme/me.png)


### Enviar via POST: ###
### https://soulpet.sevenclicks.us/api/auth/check  ###
##### Função: Retorna se o access_token ainda é valido. #####
```json
Passar no headers o access_token
headers = Authorization: Bearer <token>
```
####Retorna:
```json
true
```


### API - Tickets  ###
### Enviar via GET: ###≈
### retona todos os lotes de ingreso cadastrado de todos os eventos
https://soulpet.sevenclicks.us/api/tickets  ###
```json
{  
   ...
}
```

# Documentação SoulPet #


### API - Categories ###
#### Link: http://127.0.0.1:8000/api/categories ####
#### Função: Listar todas as categorias ####
##### Retorna: #####
```json
{
  "categories": [
    {
      "id": 1,
      "name": "Categoria Exemplo 1",
      "type": "CATEGORY",
      "status": "ACTIVE",
      "created_at": "2019-10-29 18:26:05",
      "updated_at": "2019-10-29 18:26:05"
    },
    {
      "id": 2,
      "name": "Categoria Exemplo 2",
      "type": "CATEGORY",
      "status": "ACTIVE",
      "created_at": "2019-10-29 18:26:05",
      "updated_at": "2019-10-29 18:26:05"
    },
}
```

##### ________________________________ #####

#### Link: http://127.0.0.1:8000/api/category/1 ####
#### Função: Listar uma categoria pelo id ####
##### Retorna: #####
```json
{
  "category": [
    {
      "id": 1,
      "name": "Categoria Exemplo 1",
      "type": "CATEGORY",
      "status": "ACTIVE",
      "created_at": "2019-10-29 18:26:05",
      "updated_at": "2019-10-29 18:26:05"
    }
  ]
}
```
##### **________________________________** #####

### API - Unidades ###
#### Link: http://127.0.0.1:8000/api/categories ####
#### Função: Cadastrar uma unidade ####
##### Enviar: #####
```json
{
    "name_fantasy": "Filial 1",
    "email": "filial1@teste.com.br",
    "cnpj": "12.145.254.11/0001",
    }
```
##### Retorna: #####
```json
{
  "status": "Success",
  "data": {
    "name_fantasy": "Filial 1",
    "email": "filial1@teste.com.br",
    "cnpj": "12.145.254.11\/0001",
    "updated_at": "2019-10-29 20:25:27",
    "created_at": "2019-10-29 20:25:27",
    "id": 4
  }
}
```
##### ________________________________ #####

#### Link: http://127.0.0.1:8000/api/unities ####
#### Função: Listar todas as unidades ####
##### Retorna: #####
```json
{
  "Unities": [
    {
      "id": 1,
      "name_fantasy": "SoulPet Filial 01",
      "email": "soulpet1@teste.com.br",
      "cnpj": "12.254.255.12/0001",
      "created_at": "2019-10-29 18:26:05",
      "updated_at": "2019-10-29 18:26:05"
    },
    {
      "id": 2,
      "name_fantasy": "SoulPet Filial 02",
      "email": "soulpet2@teste.com.br",
      "cnpj": "22.452.255.12/0002",
      "created_at": "2019-10-29 18:26:05",
      "updated_at": "2019-10-29 18:26:05"
    },
}
```

##### ________________________________ #####