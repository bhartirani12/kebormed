import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection/injection_conatiner.dart';
import '../../../resources/resource.dart';
import '../bloc/bloc.dart';
import 'widgets/list_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenBloc _homeBloc;

  @override
  void initState() {
    _homeBloc = di<HomeScreenBloc>();
    _homeBloc.add(
      HomePageReadyEvent(),
    );
    _homeBloc.add(
      const FetchHomeScreenListEvent(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeBloc,
      child: BlocConsumer<HomeScreenBloc, HomeScreenState>(
        listener: (context, state) {
          if (state is HomeScreenPageReadyState) {
            debugPrint(
              state.landingDone.toString(),
            );
          } else if (state is ApiFailureState) {
            DialogWidget.showDialogBox(
              context: context,
              message: 'Something went wrong! Please try again later',
              isError: true,
            );
          } else if (state is NoInternetState) {
            DialogWidget.showDialogBox(
              context: context,
              message: translate(
                    context,
                    StringKeys.internetConnectionError,
                  ) ??
                  '',
              isError: true,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ProgressLoader(
              inAsyncCall: state is LoadingState,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: MarginKeys.commonContainerPadding,
                    horizontal: MarginKeys.bodyCommonVerticalMargin,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeadingWidget(),
                      const SizedBox(
                        height: MarginKeys.inputFieldVerticalMargin,
                      ),
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: _homeBloc.onRefresh,
                          child: ListView.builder(
                            itemCount: _homeBloc.fullUserList.length,
                            itemBuilder: (context, i) {
                              return ListItemWidget(
                                userList: _homeBloc.fullUserList[i],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeadingWidget() {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: _buildTitleWidget(
            context: context,
            title: translate(context, StringKeys.userList) ?? '',
            themeColor: Theme.of(context).colorScheme.onPrimaryFixed,
          ),
        ),
        Expanded(
          child: _buildTotalCountWidget(
            context: context,
          ),
        ),
      ],
    );
  }

  Widget _buildTitleWidget({
    required final BuildContext context,
    required final String title,
    required final Color themeColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
          top: MarginKeys.dialogBoxContentMargin * 0.8,
          left: MarginKeys.dialogBoxContentMargin * 0.8),
      child: Text(
        title,
        style: TextStyles.listItemLableStyle
            .copyWith(color: themeColor, fontSize: 20),
      ),
    );
  }

  Widget _buildTotalCountWidget({
    required final BuildContext context,
  }) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: MarginKeys.dialogBoxContentMargin,
            horizontal: MarginKeys.bodyCommonVerticalMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                children: [
                  Text(
                    translate(
                          context,
                          StringKeys.total,
                        ) ??
                        '',
                    style: TextStyles.listItemLableStyle.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryFixed,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' ${_homeBloc.fullUserList.length.toString()}',
                      style: TextStyles.listItemLableStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
