import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(RetinaScanApp());

class RetinaScanApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retina Scan AI',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF00FFCC),
        scaffoldBackgroundColor: Color(0xFF11141A),
      ),
      home: ScanHomePage(),
    );
  }
}

class ScanHomePage extends StatefulWidget {
  @override
  _ScanHomePageState createState() => _ScanHomePageState();
}

class _ScanHomePageState extends State<ScanHomePage> {
  final List<String> _models = ['gemini-3.5-flash', 'gemma-4-31b', 'paligemma'];
  String _selectedModel = 'gemini-3.5-flash';
  String _status = 'Ready';
  Map<String, dynamic>? _report;

  Future<void> _runScan() async {
    setState(() => _status = 'Scanning...');
    // Placeholder base64 image (1x1 PNG)
    const imageBase64 = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNk+M9QDwADhgGAWjR9awAAAABJRU5ErkJggg==';
    final payload = jsonEncode({
      'presetId': 'healthy_retina',
      'modelId': _selectedModel,
      'imageBase64': imageBase64,
    });
    try {
      final response = await http.post(
        Uri.parse('http://10.0.2.2:3000/api/scan'), // 10.0.2.2 maps to host from Android emulator
        headers: {'Content-Type': 'application/json'},
        body: payload,
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _report = data['report'];
          _status = 'Success';
        });
      } else {
        setState(() => _status = 'Error: ${response.statusCode}');
      }
    } catch (e) {
      setState(() => _status = 'Exception: $e');
    }
  }

  Widget _buildReportView() {
    if (_report == null) return SizedBox.shrink();
    return Card(
      margin: EdgeInsets.symmetric(vertical: 16),
      color: Color(0xFF1D2430),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Overall Status: ${_report!['overallStatus']}', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Vital Score: ${_report!['vitalScore']}', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            Text('Model Used: ${_report!['metadata']?['modelUsed']}', style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retina Scan AI'),
        backgroundColor: Color(0xFF11141A),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Select Diagnostic Model', style: TextStyle(color: Colors.white70)),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: _selectedModel,
              dropdownColor: Color(0xFF1D2430),
              items: _models.map((model) => DropdownMenuItem(
                value: model,
                child: Text(model, style: TextStyle(color: Colors.white)),
              )).toList(),
              onChanged: (val) => setState(() => _selectedModel = val ?? _selectedModel),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _runScan,
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF00FFCC),
                onPrimary: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 14),
              ),
              child: Text('Run Scan', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 12),
            Text('Status: $_status', style: TextStyle(color: Colors.white70)),
            _buildReportView(),
          ],
        ),
      ),
    );
  }
}
