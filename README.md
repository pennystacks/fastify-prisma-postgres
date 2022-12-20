# Fastify Prisma Postgres Pennystack

## Components
- Fastify
- Prisma
- Postgres

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