import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Image Picker Demo',
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello World"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Click"),
          onPressed: () {
            Fluttertoast.showToast(msg: "Hello world", textColor: Colors.black);
            _querySQLHelper();
          },
        ),
      ),
    );
  }
}

_query() async {
  /// 通过getDatabasesPath()方法获取数据库位置
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, "patientdata.db");

  /// 删除数据库
  await deleteDatabase(path);

  /// 打开数据库
  Database database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
    /// 创建数据库
    await db.execute(
        "CREATE TABLE Test(id INTEGER PRIMARY KEY,name TEXT,value INTEGER,num REAL)");
  });

  /// 在一个事务里插入一些数据
  await database.transaction((txn) async {
    int id1 = await txn.rawInsert(
        'INSERT INTO Test(name,value,num) VALUES("some goods",225,456.123)');
    print('inserted1:$id1');
    int id2 = await txn.rawInsert(
        'INSERT INTO Test(name,value,num) VALUES(?,?,?)',
        ['another name', 45456, 3.2154]);
    print('inserted2:$id2');
  });

  /// 更新记录
  int count = await database.rawUpdate(
      'UPDATE Test SET name = ?,value = ? WHERE name = ?',
      ['updated name', '9876', 'some goods']);
  print('updated:$count');

  /// 查询
  List<Map> list = await database.rawQuery('SELECT * from Test');
  List<Map> expectedList = [
    {'name': 'updated name', 'id': 1, 'value': 9876, 'num': 456.123},
    {'name': 'another name', 'id': 2, 'value': 45456, 'num': 3.2154}
  ];

  /// 断言，判断更新后的结果与预期结果是否一致
  assert(const DeepCollectionEquality().equals(list, expectedList));

  /// 统计记录数
  int count2 = Sqflite.firstIntValue(
      await database.rawQuery('SELECT COUNT(*) FROM Test'));
  assert(count2 == 2);

  /// 删除一条记录
  int count3 = await database
      .rawDelete('DELETE FROM Test WHERE name = ?', ['another name']);
  assert(count3 == 1);

  /// 关闭数据库
  await database.close();
}

_querySQLHelper() async {
  TodoProvider todoProvider = TodoProvider();

  /// 通过getDatabasesPath()方法获取数据库位置
  var databasePath = await getDatabasesPath();
  String path = join(databasePath, "patientdata.db");

  /// 删除数据库
  await deleteDatabase(path);

  /// 打开数据库，并创建todo表
  await todoProvider.open(path);

  /// 查一条数据
  Todo todo = Todo();
  todo.id = 1;
  todo.title = "Hello";
  todo.done = false;
  Todo td = await todoProvider.insert(todo);
  print('inserted:${td.toMap()}');

  Todo todo2 = Todo();
  todo2.id = 2;
  todo2.title = "Hello world";
  todo2.done = false;
  Todo td2 = await todoProvider.insert(todo2);
  print('inserted:${td2.toMap()}');

  /// 更新数据
  todo2.title = "Big big world";
  int u = await todoProvider.update(todo2);
  print("update:$u");

  /// 删除数据
  int d = await todoProvider.delete(1);
  print("delete:$d");

  /// 查询数据
  Todo dd = await todoProvider.getTodo(2);
  print("todo:${dd.toMap()}");

  /// 关闭数据库
  todoProvider.close();
}

/// 表名
final String tableTodo = 'todo';

/// _id字段
final String columnId = '_id';

/// title字段
final String columnTitle = 'title';

/// done字段
final String columnDone = 'done';

/// 操作todo表的工具类
class TodoProvider {
  Database db;

  /// 打开数据库，并创建todo表
  Future open(String path) async {
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tableTodo ( 
  $columnId integer primary key autoincrement, 
  $columnTitle text not null,
  $columnDone integer not null)
''');
    });
  }

//插入
  Future<Todo> insert(Todo todo) async {
    todo.id = await db.insert(tableTodo, todo.toMap());
    return todo;
  }

//查询
  Future<Todo> getTodo(int id) async {
    List<Map> maps = await db.query(tableTodo,
        columns: [columnId, columnDone, columnTitle],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Todo.fromMap(maps.first);
    }
    return null;
  }

//删除
  Future<int> delete(int id) async {
    return await db.delete(tableTodo, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Todo todo) async {
    return await db.update(tableTodo, todo.toMap(),
        where: '$columnId = ?', whereArgs: [todo.id]);
  }

  Future close() async => db.close();
}

/// todo对应的实体类
class Todo {
  int id;
  String title;
  bool done;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnTitle: title,
      columnDone: done == true ? 1 : 0
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Todo();

  Todo.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    done = map[columnDone] == 1;
  }
}
