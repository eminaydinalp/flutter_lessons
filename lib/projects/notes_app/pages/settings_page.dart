import 'package:first_project/projects/notes_app/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar"),
      ),
      body: SwitchListTile(
        value: themeProvider.isDark,
        onChanged: (val){
         context.read<ThemeProvider>().toggleTheme(val);
        },
        title: Text("Koyu Tema"),
      ),

    );
  }
}

