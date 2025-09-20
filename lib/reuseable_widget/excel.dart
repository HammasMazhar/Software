import 'dart:io';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ExcelHelper {
  static Future<void> exportToExcel({
    required BuildContext context,
    required List<Box> boxes,
    required String sheetName,
    required String fileName,
    required List<String> headers,
  }) async {
    var excel = Excel.createExcel();

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1");
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var box in boxes) {
      for (var key in box.keys) {
        final value = box.get(key);
        if (value is Map) {
          final stock = Map<String, dynamic>.from(value);
          sheet.appendRow(
            headers.map((h) {
              final cellValue = stock[h];
              if (cellValue is num) {
                return DoubleCellValue(cellValue.toDouble());
              }
              if (cellValue is bool) return BoolCellValue(cellValue);
              return TextCellValue(cellValue?.toString() ?? "");
            }).toList(),
          );
        }
      }
    }

    await _saveFile(context, excel, fileName);
  }

  static Future<void> exportRowsToExcel({
    required BuildContext context,
    required String sheetName,
    required String fileName,
    required List<String> headers,
    required List<List<String>> rows,
  }) async {
    var excel = Excel.createExcel();

    if (excel.sheets.containsKey("Sheet1")) {
      excel.delete("Sheet1");
    }

    Sheet sheet = excel[sheetName];
    excel.setDefaultSheet(sheetName);

    sheet.appendRow(headers.map((h) => TextCellValue(h)).toList());

    for (var row in rows) {
      sheet.appendRow(row.map((cell) => TextCellValue(cell)).toList());
    }

    await _saveFile(context, excel, fileName);
  }

  static Future<void> importFromExcel({
    required BuildContext context,
    required List<Box> boxes,
    required List<String> headers,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (result != null) {
      var bytes = File(result.files.single.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      int boxIndex = 0;

      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows.skip(1)) {
          final stock = <String, dynamic>{};

          for (int i = 0; i < headers.length; i++) {
            final cell = row.length > i ? row[i] : null;
            if (cell == null || cell.value == null) {
              stock[headers[i]] = "";
            } else if (cell.value is num) {
              stock[headers[i]] = cell.value;
            } else if (cell.value is bool) {
              stock[headers[i]] = cell.value;
            } else {
              stock[headers[i]] = cell.value.toString();
            }
          }

          boxes[boxIndex].add(stock);
          boxIndex = (boxIndex + 1) % boxes.length;
        }
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Import successful")),
        );
      }
    }
  }

  static Future<List<Map<String, dynamic>>> importRowsFromExcel({
    required BuildContext context,
    required List<String> headers,
  }) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    List<Map<String, dynamic>> importedData = [];

    if (result != null) {
      var bytes = File(result.files.single.path!).readAsBytesSync();
      var excel = Excel.decodeBytes(bytes);

      for (var table in excel.tables.keys) {
        for (var row in excel.tables[table]!.rows.skip(1)) {
          final Map<String, dynamic> data = {};
          for (int i = 0; i < headers.length; i++) {
            final cell = row.length > i ? row[i] : null;
            data[headers[i]] = cell?.value?.toString() ?? "";
          }
          importedData.add(data);
        }
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Import successful")),
        );
      }
    }

    return importedData;
  }

  static Future<void> _saveFile(
      BuildContext context, Excel excel, String fileName) async {
    String? outputFile = await FilePicker.platform.saveFile(
      dialogTitle: 'Save Excel File',
      fileName: '$fileName.xlsx',
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
    );

    if (outputFile != null) {
      File(outputFile).writeAsBytesSync(excel.encode()!);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Exported to $outputFile")),
        );
      }
    }
  }
}
