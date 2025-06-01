FROM python:3.11-slim

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/*

# Define variáveis de ambiente
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Define diretório de trabalho
WORKDIR /app

# Copia arquivos
COPY . /app/

# Instala dependências Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Porta usada pelo Flask
EXPOSE 10000

# Comando de inicialização
CMD ["python", "verificar.py"]
