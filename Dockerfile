Guia Passo a Passo: Subindo Aplicação Flask com Docker/ https://hub.docker.com/r/lucasricardo244/recicla_junto

Passo 1: Preparar o Dockerfile
Crie um arquivo chamado Dockerfile na pasta do projeto:
FROM python:3.10-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000
CMD ["python", "app_recicla_visual.py"]
Esse arquivo instala as dependências e expõe a porta 5000.

Passo 2: Criar docker-compose.yml
Crie ou edite o arquivo docker-compose.yml na mesma pasta do projeto:
version: '3.8'
services:
  app:
    image: lucasricardo244/recicla_junto:latest
    container_name: recicla_junto
    ports:
      - "5000:5000"
    restart: unless-stopped
Isso permite rodar o container com um único comando.

Passo 3: Construir e enviar a imagem para o DockerHub
No terminal, rode os seguintes comandos:
# Build da imagem
docker build -t lucasricardo244/recicla_junto:latest .
# Fazer login no DockerHub
docker login
# Enviar imagem para o DockerHub
docker push lucasricardo244/recicla_junto:latest
Sua imagem estará disponível em:
https://hub.docker.com/r/lucasricardo244/recicla_junto

Passo 4: Rodar o container com docker-compose
docker-compose up -d
-d executa em background.
Para parar:
docker-compose down
Para ver logs:
docker-compose logs -f

Passo 5: Acessar pelo navegador
Localmente:
http://localhost:5000
Na mesma rede, de outro computador:

Descubra o IP do seu computador:
ipconfig

Abra no navegador do outro computador:
http://<SEU_IP>:5000

Certifique-se de liberar a porta 5000 no firewall do Windows.

