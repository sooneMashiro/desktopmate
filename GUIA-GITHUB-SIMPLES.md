# GUIA SUPER SIMPLES - GitHub para Iniciantes

## O que você vai fazer:
1. Criar uma conta no GitHub (se não tiver)
2. Criar um repositório (pasta online)
3. Subir seus arquivos
4. GitHub compila automaticamente
5. Baixar o .exe pronto

---

## PASSO 1: Criar Conta no GitHub (se não tiver)

1. Acesse: https://github.com/signup
2. Coloque seu email
3. Crie uma senha
4. Escolha um nome de usuário
5. Confirme o email

**Já tem conta? Pule para o Passo 2!**

---

## PASSO 2: Criar Repositório

1. Acesse: https://github.com/new
2. Preencha:
   - **Repository name**: `desktop-mascot`
   - **Description**: (deixe em branco ou escreva "Meu mascote de desktop")
   - **Public ou Private**: Escolha "Private" se quiser que só você veja
   - **NÃO marque** "Add a README file"
3. Clique em **"Create repository"**

---

## PASSO 3: Subir os Arquivos (AUTOMÁTICO)

### Opção A: Usar o script automático (MAIS FÁCIL)

1. Dê duplo clique em: `upload-to-github.bat`
2. Quando pedir, cole a URL do seu repositório
   - Exemplo: `https://github.com/seu-usuario/desktop-mascot`
3. Digite seu usuário do GitHub
4. Digite sua senha (ou token - veja abaixo)
5. Pronto! Arquivos sobem automaticamente

### Opção B: Fazer manualmente

Abra o terminal na pasta do projeto e digite:

```bash
git init
git add .
git commit -m "Primeiro commit"
git branch -M main
git remote add origin https://github.com/SEU_USUARIO/desktop-mascot.git
git push -u origin main
```

**IMPORTANTE**: Substitua `SEU_USUARIO` pelo seu nome de usuário do GitHub!

---

## PASSO 4: Aguardar Compilação

1. Vá no seu repositório: `https://github.com/SEU_USUARIO/desktop-mascot`
2. Clique na aba **"Actions"** (no topo)
3. Você verá "Build Desktop Mascot" rodando (bolinha amarela girando)
4. Aguarde ~10 minutos até ficar verde ✓

---

## PASSO 5: Baixar o .exe

1. Clique no workflow que terminou (com ✓ verde)
2. Role a página até o final
3. Em **"Artifacts"**, clique em **"desktop-mascot-windows"**
4. Um arquivo .zip vai baixar
5. Extraia o .zip
6. Execute o `desktop-mascot.exe`
7. **PRONTO!** 🎉

---

## ⚠️ SOBRE SENHA DO GITHUB

O GitHub não aceita mais senha normal. Você precisa de um **Personal Access Token**:

### Como criar um Token:

1. Acesse: https://github.com/settings/tokens
2. Clique em **"Generate new token"** → **"Generate new token (classic)"**
3. Em **"Note"**, escreva: `Desktop Mascot`
4. Em **"Expiration"**, escolha: `90 days`
5. Marque a caixa: **"repo"** (todas as opções de repo)
6. Role até o final e clique em **"Generate token"**
7. **COPIE O TOKEN** (você não vai ver ele de novo!)
8. Use esse token como senha quando o Git pedir

---

## 🆘 PROBLEMAS COMUNS

### "Git não é reconhecido"
- Instale o Git: https://git-scm.com/download/win
- Reinicie o terminal depois

### "Authentication failed"
- Use o Token em vez da senha (veja acima)

### "Repository not found"
- Verifique se a URL está correta
- Verifique se você está logado no GitHub

---

## 💡 DICA FINAL

Depois que funcionar uma vez:
- Você pode modificar frases, imagens, etc
- Faça commit e push novamente
- GitHub compila automaticamente
- Baixe o novo .exe

**Não precisa compilar no seu PC nunca!** 🚀
