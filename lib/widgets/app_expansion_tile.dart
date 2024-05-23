import 'package:flutter/material.dart';

class ExpansionPanelUsers extends StatelessWidget {
  const ExpansionPanelUsers({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const ExpansionPanelListRadioExample(),
      ),
    );
  }
}

// stores ExpansionPanel state information
class Item {
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
  });

  int id;
  Widget expandedValue;
  Widget headerValue;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      id: index,
      headerValue: Text('Panel $index'),
      expandedValue: Text('This is item number $index'),
    );
  });
}

class ExpansionPanelListRadioExample extends StatefulWidget {
  const ExpansionPanelListRadioExample({super.key});

  @override
  State<ExpansionPanelListRadioExample> createState() =>
      _ExpansionPanelListRadioExampleState();
}

class _ExpansionPanelListRadioExampleState
    extends State<ExpansionPanelListRadioExample> {
  final List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList.radio(
      initialOpenPanelValue: 2,
      children: _data.map<ExpansionPanelRadio>((Item item) {
        return ExpansionPanelRadio(
            value: item.id,
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: item.headerValue,
              );
            },
            body: ListTile(
                title: item.expandedValue,
                subtitle:
                    const Text('To delete this panel, tap the trash can icon'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    _data
                        .removeWhere((Item currentItem) => item == currentItem);
                  });
                }));
      }).toList(),
    );
  }
}
