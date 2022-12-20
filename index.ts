import fastify from "fastify";
import { PrismaClient, User } from "@prisma/client";

const db = new PrismaClient();

const app = fastify({ logger: true });

app.get("/json", async (req, res) => {
  return {
    hello: "world",
    foo: "bar",
  };
});

app.get("/profile/:id", async (req, res) => {
  return await db.user.findUnique({
    where: {
      id: parseInt((req.params as { id: string }).id),
    },
  });
});

app.get("/users/:page", async (req, res) => {
  const page = (req.params as { page: string }).page ?? 1;
  return await db.user.findMany({
    take: 10,
    skip: (parseInt(page) - 1) * 10,
  });
});

app.post("/users", async (req, res) => {
  const body = req.body as User;
  return await db.user.create({
    data: {
      ...body,
    },
  });
});

app.listen(
  {
    port: 5000,
  },
  (err, _addr) => {
    if (err) {
      app.log.error(err);
      process.exit(1);
    }
  }
);
