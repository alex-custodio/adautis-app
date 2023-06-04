const fastify = require('fastify')({ logger: true });
const CharacterAI = require('node_characterai');
const characterAI = new CharacterAI();

(async () => {
  await characterAI.authenticateAsGuest();
  const characterId = "iV5qb8ttzD7Ytl69U_-ONcW2tW_lrFrOVKExyKJHlJM"; 
  const chat = await characterAI.createOrContinueChat(characterId);

  fastify.post('/', async (request, reply) => {
    const message = request.body.message;
    const response = await chat.sendAndAwaitResponse(message, true);
    reply.send(response.text);
  });

  fastify.listen({port: 3001}, (err, address) => {
    if (err) throw err;
    fastify.log.info(`server listening on ${address}`);
  });
})();

/* 
curl -X POST -H "Content-Type: application/json" -d '{"message": "Hello World!"}' http://localhost:3001/ */