# Usar uma imagem oficial do Node.js
FROM node:18 AS build

# Definir o diretório de trabalho no container
WORKDIR /usr/src/app

# Copiar arquivos necessários para instalar dependências
COPY package*.json ./
COPY ./package-lock.json package-lock.json

# Instalar as dependências
RUN npm install

# Copiar todo o código do projeto
COPY . .
COPY ./src src

# Expor a porta que o servidor irá usar
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["npm", "start"]
