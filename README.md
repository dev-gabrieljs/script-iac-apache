# Script de Instalação e Configuração do Servidor Web

Este script automatiza a instalação e configuração de um servidor web com Apache e configura um site estático a partir de um repositório GitHub.

## Funcionalidade

O script realiza as seguintes ações:

1. Atualiza o servidor.
2. Instala o Apache e o `unzip`.
3. Baixa e descompacta arquivos de um repositório GitHub.
4. Copia os arquivos descompactados para o diretório do Apache.
5. Ajusta permissões de arquivos.
6. Reinicia o Apache para aplicar as mudanças.

## Tornar o Script Executável

Para tornar o script executável, use o comando:

```bash
chmod +x script.sh
```

## Executar o Script como Superusuário

Para executar o script com permissões de superusuário, use o comando:

```bash
sudo ./script.sh
