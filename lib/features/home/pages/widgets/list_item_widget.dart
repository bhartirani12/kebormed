import 'package:flutter/material.dart';
import 'package:kebormed/domain/entities/home_entity.dart';
import 'package:kebormed/features/user_detail/pages/user_detail.dart';
import '../../../../resources/app_localizations.dart';
import '../../../../resources/margin_keys.dart';
import '../../../../resources/string_keys.dart';
import '../../../../resources/styles/text_styles.dart';
import '../../../../resources/widgets/common_container.dart';

class ListItemWidget extends StatelessWidget {
  final UserDataEntity userList;
  const ListItemWidget({
    required this.userList,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailScreen(
              userDetail: userList,
            ),
          ),
        );
      },
      child: CommonContainer(
        child: Column(
          children: [
            _buildLabelValueWidget(
              context: context,
              labelName: translate(context, StringKeys.name) ?? '',
              labelValue: userList.name,
              themeColor: Colors.grey,
            ),
            _buildLabelValueWidget(
              context: context,
              labelName: translate(context, StringKeys.email) ?? '',
              labelValue: userList.email,
              themeColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabelValueWidget({
    required final BuildContext context,
    required final String labelName,
    required final String labelValue,
    required final Color themeColor,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(top: MarginKeys.dialogBoxContentMargin * 0.3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              labelName,
              style: TextStyles.listItemLableStyle.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryFixed,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              labelValue,
              style: TextStyles.listItemLableStyle.copyWith(
                color: Theme.of(context).colorScheme.outline,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
