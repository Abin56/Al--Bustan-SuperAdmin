// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// class ListViewTableGridWidget extends StatefulWidget {
//   const ListViewTableGridWidget({super.key});

//   @override
//   State<ListViewTableGridWidget> createState() => _ListViewTableGridWidgetState();
// }

// class _ListViewTableGridWidgetState extends State<ListViewTableGridWidget> {
//   @override
// List<Employee> _employees = <Employee>[];
// late EmployeeDataSource _employeeDataSource;
// @override
//  void initState() {
//  super.initState();
//  _employees = getEmployeeData();
//  _employeeDataSource = EmployeeDataSource(_employees);
//  }

//  @override
//  Widget build(BuildContext context) {
//  return Scaffold(
//  appBar: AppBar(
//  title: const Text('Flutter SfDataGrid'),
//  ),
//  body: SfDataGrid(
//  source: _employeeDataSource,
//  columns: getColumns,
//  columnWidthMode: ColumnWidthMode.fill,
//  allowSorting: true,
//  onCellTap: ((details) {
//  if (details.rowColumnIndex.rowIndex != 0) {
//  int selectedRowIndex = details.rowColumnIndex.rowIndex - 1;
//  var row =
//  _employeeDataSource.effectiveRows.elementAt(selectedRowIndex);

//  showDialog(
//  context: context,
//  builder: (context) => AlertDialog(
//  shape: const RoundedRectangleBorder(
//  borderRadius: BorderRadius.all(Radius.circular(32.0))),
//  content: SizedBox(
//  height: 300,
//  width: 300,
//  child: Column(
//  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//  children: [
//  Row(children: [
//  const Text('Employee ID'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 25)),
//  const Text(':'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 10)),
//  Text(row.getCells()[0].value.toString()),
//  ]),
//  Row(children: [
//  const Text('Employee Name'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 10)),
//  const Text(':'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 10)),
//  Text(row.getCells()[1].value.toString()),
//  ]),
//  Row(children: [
//  const Text('Designation'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 25)),
//  const Text(':'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 10)),
//  Text(row.getCells()[2].value.toString()),
//  ]),
//  Row(children: [
//  const Text('Salary'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 45)),
//  const Text(':'),
//  const Padding(
//  padding:
//  EdgeInsets.symmetric(horizontal: 10)),
//  Text(row.getCells()[3].value.toString()),
//  ]),
//  SizedBox(
//  width: 300,
//  child: ElevatedButton(
//  onPressed: () {
//  Navigator.pop(context);
//  },
//  child: const Text("OK")),
//  )
//  ]),
//  )));
//  }
//  }),
//  ),
//  );
//  }

// }
// class EmployeeDataSource extends DataGridSource {
// EmployeeDataSource(List<Employee> employees) {
//  buildDataGridRow(employees);
// }
// void buildDataGridRow(List<Employee> employeeData) {
// dataGridRow = employeeData.map<DataGridRow>((employee) {
//  return DataGridRow(cells: [
//  DataGridCell<int>(columnName: 'id', value: employee.id),
//  DataGridCell<String>(columnName: 'name', value: employee.name),
//  DataGridCell<String>(
//  columnName: 'designation', value: employee.designation),
//  DataGridCell<int>(columnName: 'salary', value: employee.salary),
//  ]);
//  }).toList();
//  }

//  List<DataGridRow> dataGridRow = <DataGridRow>[];

//  @override
//  List<DataGridRow> get rows => dataGridRow.isEmpty ? [] : dataGridRow;

//  @override
//  DataGridRowAdapter? buildRow(DataGridRow row) {
//  return DataGridRowAdapter(
//  cells: row.getCells().map<Widget>((dataGridCell) {
//  return Container(
//  alignment: Alignment.center,
//  padding: const EdgeInsets.symmetric(horizontal: 8.0),
//  child: SelectableText(dataGridCell.value.toString()),
//  );
//  }).toList());
//  }
// }
