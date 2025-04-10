import 'package:learning_system/utils/imports.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'profile'.tr,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: AppColors.primaryText,
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 60, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(
                            controller.profile.value.avatar ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'name'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.person,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.name ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'email'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.email,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.email ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'gender'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                controller.profile.value.gender == 'male'
                                    ? Icons.male
                                    : Icons.female,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.gender ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'role'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                controller.profile.value.role == 'student'
                                    ? Icons.school
                                    : Icons.work,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.role ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'status'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.verified_user,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.status ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'created_at'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.date_range,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.createdAt ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 15),

                        Text(
                          'updated_at'.tr,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Container(
                          height: 40,
                          width: double.infinity,
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center, 
                            children: [
                              Icon(
                                Icons.date_range,
                                color: AppColors.primaryTextLight,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                controller.profile.value.updatedAt ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.primaryTextLight,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 40),

                        CustomButton(
                          onTap: () {},
                          btnText: 'logout'.tr,
                          width: Get.width,
                        ),
                      ],
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
}
