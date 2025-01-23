local ls = require("luasnip") -- Load LuaSnip
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("dart", {
  -- Stateless Widget
  s("stless", {
    t({
      "import 'package:flutter/material.dart';",
      "",
      "class ",
    }),
    i(1, "MyWidget"),
    t({
      " extends StatelessWidget {",
      "  @override",
      "  Widget build(BuildContext context) {",
      "    return Scaffold(",
      "      appBar: AppBar(",
      "        title: Text('",
    }),
    i(1, "MyWidget"),
    t({
      "'),",
      "      ),",
      "      body: Center(",
      "        child: Text('Hello, Flutter!'),",
      "      ),",
      "    );",
      "  }",
      "}",
    }),
  }),

  -- Stateful Widget
  s("stful", {
    t({
      "import 'package:flutter/material.dart';",
      "",
      "class ",
    }),
    i(1, "MyStatefulWidget"),
    t({
      " extends StatefulWidget {",
      "  @override",
      "  _",
    }),
    i(1, "MyStatefulWidget"),
    t({
      "State createState() => _",
    }),
    i(1, "MyStatefulWidget"),
    t({
      "State();",
      "}",
      "",
      "class _",
    }),
    i(1, "MyStatefulWidget"),
    t({
      "State extends State<",
    }),
    i(1, "MyStatefulWidget"),
    t({
      "> {",
      "  int _counter = 0;",
      "",
      "  void _incrementCounter() {",
      "    setState(() {",
      "      _counter++;",
      "    });",
      "  }",
      "",
      "  @override",
      "  Widget build(BuildContext context) {",
      "    return Scaffold(",
      "      appBar: AppBar(",
      "        title: Text('",
    }),
    i(1, "MyStatefulWidget"),
    t({
      "'),",
      "      ),",
      "      body: Center(",
      "        child: Column(",
      "          mainAxisAlignment: MainAxisAlignment.center,",
      "          children: <Widget>[",
      "            Text('You have pushed the button this many times:'),",
      "            Text(",
      "              '$_counter',",
      "              style: Theme.of(context).textTheme.headline4,",
      "            ),",
      "          ],",
      "        ),",
      "      ),",
      "      floatingActionButton: FloatingActionButton(",
      "        onPressed: _incrementCounter,",
      "        tooltip: 'Increment',",
      "        child: Icon(Icons.add),",
      "      ),",
      "    );",
      "  }",
      "}",
    }),
  }),

  -- Container with Padding and Margin
  s("containerpad", {
    t({
      "Container(",
      "  padding: const EdgeInsets.all(",
    }),
    i(1, "8.0"),
    t({
      "),",
      "  margin: const EdgeInsets.all(",
    }),
    i(2, "10.0"),
    t({
      "),",
      "  decoration: BoxDecoration(",
      "    border: Border.all(color: Colors.black),",
      "    borderRadius: BorderRadius.circular(",
    }),
    i(3, "10"),
    t({
      "),",
      "  ),",
      "  child: ",
    }),
    i(4, "Text('Hello Container')"),
    t({ ")," }),
  }),

  -- ListView.builder
  s("listviewbuilder", {
    t({
      "ListView.builder(",
      "  itemCount: ",
    }),
    i(1, "10"),
    t({
      ",",
      "  itemBuilder: (context, index) {",
      "    return ListTile(",
      "      title: Text('Item ${index + 1}'),",
      "    );",
      "  },",
      ")",
    }),
  }),

  -- FutureBuilder
  s("futurebuilder", {
    t({
      "FutureBuilder<",
    }),
    i(1, "DataType"),
    t({
      ">(",
      "  future: ",
    }),
    i(2, "yourFutureFunction()"),
    t({
      ",",
      "  builder: (context, snapshot) {",
      "    if (snapshot.connectionState == ConnectionState.waiting) {",
      "      return CircularProgressIndicator();",
      "    } else if (snapshot.hasError) {",
      "      return Text('Error: ${snapshot.error}');",
      "    } else {",
      "      return ",
    }),
    i(3, "YourWidget"),
    t({
      "(data: snapshot.data);",
      "    }",
      "  },",
      ")",
    }),
  }),
})
