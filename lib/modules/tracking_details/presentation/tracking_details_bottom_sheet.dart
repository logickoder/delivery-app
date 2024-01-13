import 'package:flutter/material.dart';

import '../../../core/app/dimen.dart';
import '../../../core/app/theme.dart';
import '../../../core/presentation/view_model_provider.dart';
import '../../shared/widgets/history_item.dart';
import '../domain/entity/tracking_detail.dart';
import 'tracking_details_view_model.dart';

class TrackingDetailsBottomSheet extends StatefulWidget {
  final ValueChanged<bool>? onFullView;

  const TrackingDetailsBottomSheet({super.key, this.onFullView});

  @override
  State<TrackingDetailsBottomSheet> createState() =>
      _TrackingDetailsBottomSheetState();
}

class _TrackingDetailsBottomSheetState
    extends State<TrackingDetailsBottomSheet> {
  final _controller = DraggableScrollableController();

  @override
  void initState() {
    _controller.addListener(_watchForSheetDrag);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ViewModelProvider.of<TrackingDetailsViewModel>(context);
    final color = AppColor.of(context);

    return ListenableBuilder(
      listenable: viewModel.state,
      builder: (_, __) {
        final detail = viewModel.detail.value;

        if (detail == null || viewModel.loading.value) {
          return const SizedBox();
        }

        const initial = 0.155;
        return DraggableScrollableSheet(
          initialChildSize: initial,
          maxChildSize: AppDimen.widthFactor,
          minChildSize: initial,
          expand: true,
          snap: true,
          controller: _controller,
          builder: (_, scrollController) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: color.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(42),
                  topRight: Radius.circular(42),
                ),
              ),
              child: FractionallySizedBox(
                widthFactor: AppDimen.widthFactor,
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    const _DragHandle(),
                    _Title(detail.arrivalTime),
                    _DetailInfo(detail),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Text(
                          'History',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: color.listTitle,
                          ),
                        ),
                      ),
                    ),
                    _History(detail),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Blurs the screen when the sheet is half of the screen
  void _watchForSheetDrag() {
    final screenHeight = MediaQuery.of(context).size.height;
    final sheetHeight = _controller.pixels;

    widget.onFullView?.call(sheetHeight > screenHeight / 2);
  }
}

class _DragHandle extends StatelessWidget {
  const _DragHandle();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: UnconstrainedBox(
        child: Container(
          height: 5,
          width: 48,
          margin: const EdgeInsets.only(top: 16, bottom: 24),
          decoration: BoxDecoration(
            color: const Color(0xFFDBE2E9),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final DateTime _arrivalTime;

  const _Title(this._arrivalTime);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final hour = _arrivalTime.difference(now).inHours;
    final minute = _arrivalTime.difference(now).inMinutes % 60;
    return SliverToBoxAdapter(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Estimate arrives in'),
                Text(
                  '${hour}h ${minute}m',
                  style: TextStyle(
                    color: AppColor.of(context).listTitle,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (index) {
              return Container(
                margin: const EdgeInsets.all(3),
                width: 3,
                height: 3,
                decoration: BoxDecoration(
                  color: AppColor.of(context).listTitle,
                  shape: BoxShape.circle,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}

class _DetailInfo extends StatelessWidget {
  final TrackingDetailEntity _detail;

  const _DetailInfo(this._detail);

  @override
  Widget build(BuildContext context) {
    const divider = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(color: Color(0xFFEDC127)),
    );

    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(vertical: 24),
        decoration: BoxDecoration(
          color: AppColor.of(context).primary,
          borderRadius: BorderRadius.circular(24),
        ),
        child: FractionallySizedBox(
          widthFactor: AppDimen.widthFactor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ..._buildSection(
                _detail.senderLocation,
                'No receipt: ${_detail.receiptNumber}',
                context,
              ),
              divider,
              ..._buildSection(
                'NGN ${_detail.postalFee}',
                'Postal fee',
                context,
              ),
              divider,
              ..._buildSection(
                _detail.receiverLocation,
                'Parcel: ${_detail.weight}kg',
                context,
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildSection(
      String title, String content, BuildContext context) {
    final color = AppColor.of(context);
    return [
      Text(
        title,
        style: TextStyle(
          color: color.listTitle,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(height: 8),
      Text(
        content,
        style: TextStyle(
          fontSize: 12,
          color: color.onPrimary,
        ),
      ),
    ];
  }
}

class _History extends StatelessWidget {
  final TrackingDetailEntity _detail;

  const _History(this._detail);

  @override
  Widget build(BuildContext context) {
    final color = AppColor.of(context);

    return SliverFillRemaining(
      child: CustomMultiChildLayout(
        delegate: _HistoryLayoutDelegate(),
        children: [
          LayoutId(
            id: #divider,
            child: const VerticalDivider(
              color: Color(0xFFDFE6ED),
              width: 1.5,
            ),
          ),
          LayoutId(
            id: #history1,
            child: HistoryItem(
              title: _detail.status,
              subtitle: _detail.receiverLocation,
              icon: '🚚',
              iconBackground: color.primary,
              trailing: const Text(
                '00:00 PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          LayoutId(
            id: #history2,
            child: HistoryItem(
              title: 'Transit - Sending City',
              subtitle: _detail.transitLocation,
              icon: '📬',
              iconBackground: color.card,
              trailing: const Text(
                '21:00 PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          LayoutId(
            id: #history3,
            child: HistoryItem(
              title: 'Send Form Sukabumi',
              subtitle: _detail.senderLocation,
              icon: '📦',
              iconBackground: color.card,
              trailing: const Text(
                '19:00 PM',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _HistoryLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    final constraints = BoxConstraints(
      maxHeight: size.height,
      maxWidth: size.width,
    );

    const space = 32.0;

    final history1 = layoutChild(#history1, constraints);
    final history2 = layoutChild(#history2, constraints);
    final history3 = layoutChild(#history3, constraints);

    final dividerConstraints = constraints.copyWith(
      maxHeight: ((history1.height / 2) +
          (history3.height / 2) +
          space * 2 +
          history2.height),
    );
    layoutChild(#divider, dividerConstraints);

    positionChild(
      #history1,
      Offset.zero,
    );
    positionChild(
      #history2,
      Offset(0, history1.height + space),
    );
    positionChild(
      #history3,
      Offset(0, history1.height + space + history2.height + space),
    );
    positionChild(
      #divider,
      Offset(history1.width * .09, history1.height / 2),
    );
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) => false;
}
