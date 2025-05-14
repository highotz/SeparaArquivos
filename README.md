
# Script de Separação de Arquivos

Este script foi desenvolvido para resolver um problema na empresa onde trabalho. O ambiente de trabalho não permite o envio de mais de 2.000 arquivos por vez, e eu precisava separar manualmente os arquivos em lotes. Esse script automatiza esse processo, facilitando o trabalho e economizando tempo.

## Como Funciona?

O script **separa arquivos em lotes de até 2.000 arquivos**, movendo-os de uma pasta de origem para pastas de destino. Caso a pasta de origem ou destino não exista, o script **as cria automaticamente** e fornece instruções ao usuário.

## Pré-Requisitos

- O script foi desenvolvido para rodar em ambientes **Windows**.
- Não é necessário instalar nada extra, apenas o Windows e o Prompt de Comando.

## Como Usar

1. **Baixe ou clone este repositório**.
2. **Coloque o script `separar_arquivos.bat` na pasta onde deseja executar**.
3. Quando o script for executado pela primeira vez, ele **irá criar as pastas** `Origem` e `Destino` se elas não existirem.
4. **Adicione os arquivos que deseja separar na pasta `Origem`**.
5. **Execute novamente o script** para separar os arquivos em pastas de 2.000 arquivos.
6. Após a execução, o script informará a quantidade de arquivos movidos e as pastas criadas.

### Exemplos:

- **Estrutura das pastas após execução:**
  
  ```
  Origem/
    arquivo1.txt
    arquivo2.txt
    ...
  
  Destino/
    saida_1/
      arquivo1.txt
      arquivo2.txt
      ...
    saida_2/
      arquivo2001.txt
      arquivo2002.txt
      ...
  ```

## Mensagens do Script

Durante a execução, o script exibirá as seguintes mensagens:

- **Se as pastas não existirem**: O script cria automaticamente e avisa o usuário.
- **Se não houver arquivos na pasta origem**: O script avisa que a pasta está vazia e pede para colocar arquivos nela.
- **Durante o processo**: Ele mostra a quantidade de arquivos sendo movidos e cria pastas conforme necessário.
- **Ao final**: Informa o número total de arquivos movidos e quantas pastas foram criadas.

## Exemplo de Saída no Console

```

============================================
Iniciando separação de arquivos...
============================================

[INFO] Pasta de origem criada: C:\Users\Usuario\Documents\Origem\
[INFO] Pasta de destino criada: C:\Users\Usuario\Documents\Destino\

============================================
As pastas necessárias foram criadas.
Coloque os arquivos que deseja separar em:
   C:\Users\Usuario\Documents\Origem\
Depois, execute este script novamente.
============================================
Pressione uma tecla para continuar...
```

## Contribuições

Se você tem sugestões ou melhorias para o script, fique à vontade para abrir um **Pull Request** ou **Issues**.
