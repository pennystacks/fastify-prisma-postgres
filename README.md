# Fastify Prisma Render Pennystack

## Components
- Fastify
- Prisma
- Postgres
- Render.com

## Infrastructure
Render.com Web Service East US (Ohio)
  
| Property  | Value |
| ------------- | ------------- |
| Price  | Free  |
| Memory  | 512MB  |
| CPU | Shared |

Supabase Postgres East US (North Virginia)
| Property  | Value |
| ------------- | ------------- |
| Price  | Free  |
| Memory  | Unknown  |
| CPU | Unknown |
| Storage | 500 MB |

## Running
Add .env with DATBASE_URL

```shell
npm install
npx prisma migrate dev
```

Creating a local postgres db (Supabase doesn't let you create a shadow db)

```shell
docker run -p 5432:5432 --name pennydb -d -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -e POSTGRES_DB=pennydb postgres
```