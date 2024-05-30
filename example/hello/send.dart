import "package:dart_amqp/dart_amqp.dart";

void main() async {
  Client client = Client();
  Channel channel = await client.channel();

  String message = "Hello World!";

  BasicPublish pubRequest = BasicPublish()
    ..reserved_1 = 0
    ..routingKey = "queue-name"
    ..exchange = "exchange-name"
    ..mandatory = false
    ..immediate = false;
  channel.writeMessage(pubRequest, payloadContent: message);

  print(" [x] Sent 'Hello World!'");
  await client.close();
}
