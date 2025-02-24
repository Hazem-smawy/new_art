import 'package:newart/src/core/constants/assets.dart';
import 'package:newart/src/core/widgets/empty_widget.dart';
import 'package:flutter/material.dart';

class ReusableFutureBuilder<T> extends StatelessWidget {
  final Future<T> future;
  final Widget Function(BuildContext context, T data) builder;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final String? errorMessage;
  final Widget? emptyWidget;

  const ReusableFutureBuilder({
    super.key,
    required this.future,
    required this.builder,
    this.loadingWidget,
    this.errorWidget,
    this.errorMessage,
    this.emptyWidget,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Display loading widget or a default CircularProgressIndicator
          return loadingWidget ??
              const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Display the error widget or a default error message
          return errorWidget ??
              Center(child: Text(errorMessage ?? 'An error occurred'));
        } else if (snapshot.hasData && snapshot.data != null) {
          final data = snapshot.data;
          // If the data is a list and it's empty, show emptyWidget
          if (data is List && data.isEmpty) {
            return emptyWidget ??
                const EmptyWidget(
                  imageName: Assets.assetsImagesCurencies,
                  label: 'هذه الصفحة فارغة',
                );
          }
          // Use the provided builder function to render the UI
          return builder(context, data as T);
        } else {
          // If the data is null or empty, show the emptyWidget
          return emptyWidget ?? const Center(child: Text("No data available"));
        }
      },
    );
  }
}
