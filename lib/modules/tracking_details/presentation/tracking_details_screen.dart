import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show SystemUiOverlayStyle;

import '../../../core/presentation/view_model_provider.dart';
import 'tracking_details_bottom_sheet.dart';
import 'tracking_details_input.dart';
import 'tracking_details_map.dart';
import 'tracking_details_top_bar.dart';
import 'tracking_details_view_model.dart';

class TrackingDetailsScreen extends StatefulWidget {
  static const id = '/orders/tracking';

  const TrackingDetailsScreen({super.key});

  @override
  State<TrackingDetailsScreen> createState() => _TrackingDetailsScreenState();
}

class _TrackingDetailsScreenState extends State<TrackingDetailsScreen> {
  final _viewModel = getTrackingDetailsViewModel();
  var _blurScreen = false;

  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      await _viewModel.init(_receiptNumber, context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: ViewModelProvider(
          _viewModel,
          child: Stack(
            children: [
              const TrackingDetailsMap(),
              SafeArea(
                child: Column(
                  children: [
                    const TrackingDetailsTopBar(),
                    const SizedBox(height: 49),
                    TrackingDetailsInput(_receiptNumber),
                  ],
                ),
              ),
              if (_blurScreen) ...{
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                  child: AnimatedContainer(
                    width: double.infinity,
                    height: double.infinity,
                    duration: Durations.long4,
                    color: Colors.black.withOpacity(0.5),
                  ),
                )
              },
              TrackingDetailsBottomSheet(onFullView: _onBlurScreen),
            ],
          ),
        ),
      ),
    );
  }

  String get _receiptNumber =>
      ModalRoute.of(context)!.settings.arguments as String;

  void _onBlurScreen(bool value) {
    setState(() => _blurScreen = value);
  }
}
