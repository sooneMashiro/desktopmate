# Como Compilar Usando GitHub Actions

Se você não consegue compilar localmente devido a políticas de TI, use o GitHub para compilar na nuvem!

## Passo a Passo:

### 1. Criar Repositório no GitHub
1. Acesse https://github.com
2. Clique em "New repository"
3. Nome: `desktop-mascot`
4. Deixe público ou privado (sua escolha)
5. Clique em "Create repository"

### 2. Subir o Código
No terminal (PowerShell ou CMD), na pasta do projeto:

```bash
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/desktop-mascot.git
git push -u origin main
```

### 3. GitHub Actions Vai Compilar Automaticamente
- Após o push, vá em "Actions" no GitHub
- Você verá o workflow "Build Desktop Mascot" rodando
- Aguarde ~10 minutos (compilação na nuvem)

### 4. Baixar o Executável
- Quando terminar, clique no workflow concluído
- Role até "Artifacts"
- Baixe "desktop-mascot-windows"
- Extraia o `.exe` e execute!

## Alternativa: Compilar Manualmente Quando Precisar

Se você não quiser usar GitHub, pode:
1. Pedir a um amigo com PC pessoal para compilar
2. Usar um PC pessoal em casa
3. Usar um serviço online de compilação

## Modificar o Código Depois

Se quiser mudar frases ou imagens:
1. Edite os arquivos localmente
2. Faça commit e push
3. GitHub Actions compila automaticamente
4. Baixe o novo `.exe`

---

**Dica**: Guarde o `.exe` compilado em um lugar seguro. Você só precisa compilar uma vez, depois pode usar sempre!
