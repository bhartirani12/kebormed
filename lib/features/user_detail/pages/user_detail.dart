import 'package:flutter/material.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import '../../../resources/resource.dart';

class UserDetailScreen extends StatefulWidget {
  final UserDataEntity userDetail;

  const UserDetailScreen({
    super.key,
    required this.userDetail,
  });

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: MarginKeys.commonContainerPadding,
            horizontal: MarginKeys.bodyCommonVerticalMargin,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBackWidget(context: context, iconSize: 12),
              const SizedBox(
                height: MarginKeys.inputFieldVerticalMargin,
              ),
              const SizedBox(
                height: MarginKeys.inputFieldVerticalMargin,
              ),
              _buildUserDetailWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackWidget({
    required final BuildContext context,
    final double iconSize = 18,
  }) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Icon(
              Icons.arrow_back,
              color: Theme.of(context).colorScheme.onPrimaryFixed,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
        ),
        _buildTitleWidget(
          context: context,
          title: translate(context, StringKeys.userDetail) ?? '',
          themeColor: Theme.of(context).colorScheme.onPrimaryFixed,
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
        style: TextStyles.listItemLableStyle.copyWith(
          color: themeColor,
          fontSize: 22,
        ),
      ),
    );
  }

  Widget _buildUserDetailWidget() {
    return CommonContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.name) ?? '',
            labelValue: widget.userDetail.name,
          ),
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.email) ?? '',
            labelValue: widget.userDetail.email,
          ),
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.phone) ?? '',
            labelValue: widget.userDetail.phone,
          ),
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.website) ?? '',
            labelValue: widget.userDetail.website,
          ),
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.address) ?? '',
            labelValue:
                '${widget.userDetail.address.suite} - ${widget.userDetail.address.street}, ${widget.userDetail.address.city} (${widget.userDetail.address.zipcode})',
          ),
          const SizedBox(
            height: MarginKeys.inputFieldVerticalMargin,
          ),
          _buildLabelValueWidget(
            context: context,
            labelName: translate(context, StringKeys.company) ?? '',
            labelValue: widget.userDetail.company.name,
          ),
        ],
      ),
    );
  }

  Widget _buildLabelValueWidget({
    required final BuildContext context,
    required final String labelName,
    required final String labelValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelName,
          style: TextStyles.listItemLableStyle.copyWith(
            color: Theme.of(context).colorScheme.onPrimaryFixed,
            fontSize: 15,
          ),
        ),
        Text(
          labelValue,
          style: TextStyles.listItemLableStyle.copyWith(
            color: Theme.of(context).colorScheme.outline,
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
