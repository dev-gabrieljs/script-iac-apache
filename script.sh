#!/bin/bash

# Função para verificar o status de sucesso de comandos
check_success() {
    if [ $? -ne 0 ]; then
        echo "Erro: $1. Abortando."
        exit 1
    fi
}

echo "Atualizando o servidor..."
sudo apt-get update -y
check_success "Falha na atualização dos pacotes"

sudo apt-get upgrade -y
check_success "Falha na atualização dos pacotes"

echo "Instalando Apache e unzip..."
sudo apt-get install apache2 unzip -y
check_success "Falha na instalação do Apache ou unzip"

echo "Baixando e copiando os arquivos da aplicação..."

# Muda para o diretório temporário
cd /tmp || { echo "Falha ao acessar o diretório /tmp. Abortando."; exit 1; }

# Baixa o arquivo zip
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
check_success "Falha ao baixar o arquivo main.zip"

# Descompacta o arquivo
unzip main.zip
check_success "Falha ao descompactar o arquivo main.zip"

# Muda para o diretório descompactado
cd linux-site-dio-main || { echo "Falha ao acessar o diretório linux-site-dio-main. Abortando."; exit 1; }

# Copia os arquivos para o diretório do Apache
sudo cp -R * /var/www/html/
check_success "Falha ao copiar os arquivos para /var/www/html/"

# Ajusta permissões para garantir que o Apache possa ler os arquivos
sudo chown -R www-data:www-data /var/www/html/
sudo chmod -R 755 /var/www/html/
check_success "Falha ao ajustar permissões dos arquivos"

# Reinicia o Apache para aplicar as mudanças
sudo systemctl restart apache2
check_success "Falha ao reiniciar o Apache"

echo "Servidor web configurado com sucesso!"
