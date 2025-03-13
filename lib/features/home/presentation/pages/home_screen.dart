import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tozauz_agent/export.dart';
import 'package:tozauz_agent/features/common/widget/app_text_style.dart';
import 'package:tozauz_agent/features/common/widget/custom_app_bar.dart';
import 'package:tozauz_agent/features/home/data/models/container_model.dart';
import 'package:tozauz_agent/features/home/presentation/pages/widget/container_item.dart';

import '../../../../core/values/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Konterneylar",
      ),
      body: BlocBuilder<ContainerCubit, ContainerState>(
        builder: (context, state) {
          if (state.boxListStatus == Status.LOADING) {
            return LoadingWidget();
          } else if (state.boxListStatus == Status.ERROR) {
            return Column(
              children: [
                20.verticalSpace,
                Text(
                  state.boxListFailure.getLocalizedMessage(context),
                  style: AppTextStyles().body20w6,
                ),
                20.verticalSpace,
                CustomButton(
                  text: "Qayta yuklash",
                  onTap: () {
                    context.read<ContainerCubit>().fetchBoxes();
                  },
                ),
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: ()async{
              context.read<ContainerCubit>().fetchBoxes();
            },
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              itemBuilder: (context, index) {
                return ContainerItem(
                  model: state.boxList[index],
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.containerDetailScreen);
                  },
                );
              },
              separatorBuilder: (context, index) {
                return 10.verticalSpace;
              },
              itemCount: state.boxList.length,
            ),
          );
        },
      ),
    );
  }
}
