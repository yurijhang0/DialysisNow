import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/report.dart';

class ReportList extends StatefulWidget {
  const ReportList({Key key}) : super(key: key);

  @override
  State<ReportList> createState() => _ReportListState();
}

class _ReportListState extends State<ReportList> {
  @override
  Widget build(BuildContext context) {

    final reports = Provider.of<List<Report>>(context);

    if (reports != null) {
      reports.forEach((reports) {
        print(reports.powerOutage);
        print(reports.hurricane);
        print(reports.waterContamination);
        print(reports.internal);
        print(reports.other);
        print(reports.addInfo);
      });
    }

    return ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          return
        },
    );
  }
}
