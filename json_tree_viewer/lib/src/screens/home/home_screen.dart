import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../core/services/json_service.dart';

enum _FileLoadStatus { initial, loading, error }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ValueNotifier<_FileLoadStatus> _status;

  @override
  void initState() {
    _status = ValueNotifier<_FileLoadStatus>(_FileLoadStatus.initial);
    _status.addListener(() {
      debugPrint('home: ${_status.value.toString()}');
      if (_status.value == _FileLoadStatus.loading) {
        _showLoaderDialog();
      } else if (_status.value == _FileLoadStatus.error) {
        debugPrint('home: dialog dismissed');
        Navigator.of(context, rootNavigator: false).pop();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _status.dispose();
    super.dispose();
  }

  void _showLoaderDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        debugPrint('home: dialog invoked');
        return const AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Analyzing file...', textAlign: TextAlign.center),
              SizedBox(height: 8.0),
              LinearProgressIndicator(),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectableText('JSON Tree Viewer', style: textTheme.titleLarge),
            const SizedBox(height: 16.0),
            SelectableText(
              'Simple JSON Viewer that runs completely on-client. No data exchange',
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
            FilledButton(
              onPressed: () async {
                final FilePickerResult? result = await FilePicker.platform.pickFiles(
                  dialogTitle: 'Select a JSON file',
                  allowedExtensions: const ['json'],
                  type: FileType.custom,
                  allowMultiple: false,
                  withReadStream: true,
                );
                if (result != null) {
                  _status.value = _FileLoadStatus.loading;
                  final bool isFileLoaded = await JsonService.instance.load(result.files.first.readStream!);
                  if (!isFileLoaded) {
                    _status.value = _FileLoadStatus.error;
                  }
                }
              },
              child: Text(
                'Load JSON',
                style: textTheme.bodyMedium?.copyWith(color: Colors.black, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(height: 16.0),
            ValueListenableBuilder<_FileLoadStatus>(
              valueListenable: _status,
              builder: (context, status, child) {
                if (status == _FileLoadStatus.error) {
                  return Text(
                    'Invalid file. Please load a valid JSON file.',
                    style: textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.error),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
