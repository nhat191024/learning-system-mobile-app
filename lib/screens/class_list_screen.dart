import 'package:learning_system/utils/imports.dart';

class ClassListScreen extends GetView<ClassController> {
  ClassListScreen({super.key}) {
    controller.searchController.addListener(() {
      if (controller.searchController.text.isNotEmpty) {
        controller.classFilter(controller.searchController.text);
      } else {
        controller.filteredList.value = controller.classList;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 110,
                padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Obx(() {
                  return controller.isSearching.value
                      ? Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(50),
                                    border: Border.all(
                                      color: AppColors.primary,
                                      width: 1,
                                    ),
                                  ),
                                  child: TextField(
                                    focusNode: controller.searchFocusNode,
                                    controller: controller.searchController,
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: AppColors.primary,
                                      ),
                                      hintText: "search".tr,
                                      hintStyle: const TextStyle(
                                        color: AppColors.secondaryText,
                                      ),
                                      border: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                            vertical: 15,
                                            horizontal: 10,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.isSearching.value = false;
                                    controller.searchController.clear();
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'class_list'.tr,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: AppColors.primaryText,
                              fontWeight: FontWeight.w600,
                              fontSize: 22,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              controller.isSearching.value = true;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.search,
                                color: AppColors.primaryTextLight,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      );
                }),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else if (controller.classList.isEmpty) {
                  return Center(
                    child: Text(
                      'class_list_empty'.tr,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 26,
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: AlwaysScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: controller.filteredList.length,
                      itemBuilder: (context, index) {
                        return classCardBuilder(
                          controller.filteredList[index].name ?? '',
                          controller.filteredList[index].description ?? '',
                          controller.filteredList[index].id ?? 0,
                          controller.filteredList[index].categories ?? [],
                          controller.filteredList[index].joined ?? false,
                          10,
                          index == controller.filteredList.length - 1,
                        );
                      },
                    ),
                  );
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget classCardBuilder(
    String title,
    String description,
    int id,
    List<String> tags,
    bool joined,
    double verticalPadding,
    bool isLast,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.primaryText,
                        fontFamily: FontStyleTextStrings.medium,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryText,
                        fontFamily: FontStyleTextStrings.regular,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Wrap(
                      children:
                          tags
                              .map(
                                (tag) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  margin: const EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Text(
                                    tag,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.primaryTextLight,
                                      fontFamily: FontStyleTextStrings.medium,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onTap: () {},
                btnText: joined ? 'detail'.tr : 'join'.tr,
                height: 40,
              ),
            ],
          ),
          const SizedBox(height: 20),
          if (!isLast) const Divider(),
        ],
      ),
    );
  }
}
