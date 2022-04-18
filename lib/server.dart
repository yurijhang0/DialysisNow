import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';

void start() async {
  final db = await Db.create(
    'mongodb+srv://adminuser:**************@cluster0.88l4i.mongodb.net/reportdata?retryWrites=true&w=majority');
  await db.open();
  final coll = db.collection('reportdata');

  const port = 8081;
  final serv = Sevr();

  serv.get('/', [
  (ServRequest req, ServResponse res) async {
    final contacts = await coll.find().toList();
    return res.status(200).json({'contacts': contacts});
  }
  ]);

  serv.post('/', [
    (ServRequest req, ServResponse res) async {
    await coll.save(req.body);
    return res.json(
      await coll.findOne(where.eq('report', req.body['report'])),
    );
    }
  ]);

  serv.delete('/:id', [
    (ServRequest req, ServResponse res) async {
      await coll
          .remove(where.eq('_id', ObjectId.fromHexString(req.params['id'])));
      return res.status(200);
    }
  ]);

  serv.listen(port, callback: () {
    print('Server listening on port: $port');
  });

}