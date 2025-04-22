import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_quote/core/utils/platform_utils.dart';
import 'package:flutter_quote/viewModels/quote_view_model.dart';
import 'package:flutter_quote/views/widgets/quote_container_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _quoteController = TextEditingController();
  final _authorController = TextEditingController();
  final _quoteViewModel = QuoteViewModel();

  @override
  void initState() {
    super.initState();
    _initQuotes();
  }

  Future<void> _initQuotes() async {
    await _quoteViewModel.loadQuotes();
    _updateTextControllers();

    _quoteViewModel.addListener(_updateTextControllers);
  }

  // listener
  void _updateTextControllers() {
    if (_quoteViewModel.currentQuote != null) {
      setState(() {
        _quoteController.text = _quoteViewModel.currentQuote!.text;
        _authorController.text = _quoteViewModel.currentQuote!.author;
      });
    }
  }

  @override
  void dispose() {
    _quoteController.dispose();
    _authorController.dispose();
    _quoteViewModel.removeListener(_updateTextControllers);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Quote')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                QuoteContainerWidget(
                  labelText: 'Quote:',
                  controller: _quoteController,
                  onPressed: () {
                    _quoteViewModel.copyQuoteText();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Quote copied to clipboard')),
                    );
                  },
                ),
                SizedBox(height: 8),
                QuoteContainerWidget(
                  labelText: 'Author',
                  controller: _authorController,
                  onPressed: () {
                    _quoteViewModel.copyQuoteAuthor();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Author copied to clipboard')),
                    );
                  },
                ),
                Expanded(child: Container()),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isDark
                                ? theme.colorScheme.primaryContainer
                                : theme.colorScheme.primary,
                        foregroundColor:
                            isDark
                                ? theme
                                    .colorScheme
                                    .onSurface // Dark theme foreground
                                : theme.colorScheme.onTertiary,
                      ),
                      onPressed: () {
                        _quoteViewModel.getRandomQuote();
                      },
                      child: Text('New Quote'),
                    ),
                    // SizedBox(width: 8),
                    if (!PlatformUtils.isWeb())
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isDark
                                  ? theme.colorScheme.secondaryContainer
                                  : theme.colorScheme.secondaryContainer,
                          foregroundColor:
                              isDark
                                  ? theme
                                      .colorScheme
                                      .onSecondary // Dark theme foreground
                                  : theme.colorScheme.onTertiary,
                        ),
                        onPressed: () {
                          if (PlatformUtils.isMobile()) {
                            SystemNavigator.pop();
                          } else {
                            exit(0);
                          }
                        },
                        child: Text('Quit'),
                      ),
                  ],
                ),
                // add for buffer space at the bottom of mobile
                if (PlatformUtils.isMobile()) SizedBox(height: 32),
              ],
            ),
          );
        },
      ),
    );
  }
}
