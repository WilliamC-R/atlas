# Atlas Wealth

Base completa para uma plataforma de planejamento financeiro com:

- onboarding de cliente
- projeção patrimonial
- comparador estratégico (imóvel, aluguel, leilão, empresa, investimento)
- recomendações de proteção e tributação
- geração de PDF
- deploy direto no Render

## Stack

- FastAPI
- SQLAlchemy
- PostgreSQL no Render
- Jinja2 + HTML/CSS/JS
- ReportLab para PDF

## Estrutura

```text
atlas-wealth/
├── app/
│   ├── api/
│   ├── core/
│   ├── db/
│   ├── models/
│   ├── schemas/
│   ├── services/
│   ├── static/
│   ├── templates/
│   └── main.py
├── tests/
├── requirements.txt
├── render.yaml
└── .env.example
```

## Rodando localmente

```bash
python -m venv .venv
source .venv/bin/activate  # mac/linux
# ou .venv\Scripts\activate no Windows PowerShell
pip install -r requirements.txt
cp .env.example .env
uvicorn app.main:app --reload
```

Acesse:

- App: `http://127.0.0.1:8000`
- Healthcheck: `http://127.0.0.1:8000/health`

## Teste

```bash
pytest
```

## Deploy no Render

Este repositório já inclui `render.yaml` com:

- 1 Web Service Python
- 1 banco PostgreSQL gerenciado
- variáveis básicas de ambiente
- start command com Uvicorn

### Passos

1. Suba este projeto para um repositório GitHub.
2. No Render, crie um novo Blueprint apontando para o repositório.
3. O Render vai ler o `render.yaml` e provisionar web service + banco.
4. Após o deploy, abra a URL pública e teste a geração do plano.

## Rotas principais

- `GET /` interface web
- `GET /health` healthcheck
- `POST /api/plans` cria um planejamento
- `GET /api/plans` lista planejamentos recentes
- `GET /api/plans/{id}` consulta um planejamento
- `GET /api/plans/{id}/pdf` baixa o PDF

## Próximas evoluções recomendadas

1. autenticação por assessor
2. cadastro multiusuário com escritório/equipe
3. versionamento de relatórios
4. exportação gráfica mais sofisticada
5. integração com CDI/IPCA oficiais
6. persistência de premissas por perfil de cliente
7. painel de leads e CRM

## Observação

Para manter o MVP simples e pronto para deploy rápido, o frontend está sendo servido pela própria aplicação FastAPI. Em uma versão maior, você pode separar em:

- frontend Next.js
- backend FastAPI
- workers para geração assíncrona de PDF
- fila de jobs


## Python 3.14.3

Esta base foi ajustada para Python 3.14.3. No Windows, use preferencialmente os comandos abaixo sem ativar o venv:

```powershell
py -3.14 -m venv .venv
.\.venv\Scripts\python.exe -m pip install --upgrade pip
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m uvicorn app.main:app --reload
```

No Render, o projeto fixa `PYTHON_VERSION=3.14.3` no `render.yaml` e também inclui o arquivo `.python-version`.
