import 'package:findev/dao/Dev_dao.dart';
import 'package:findev/model/Dev.dart';

class DevController {
  DevDao devDao = DevDao();
  Future<String> save(Dev dev) {
    if (dev.id == null) {
      return devDao.insert(dev);
    } else {
      return devDao.update(dev);
    }
  }

  Future<List<Dev>> findAll() async {
    return devDao.findAll();
  }
}
