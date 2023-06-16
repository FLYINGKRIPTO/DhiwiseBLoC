import 'bloc/sign_up_sign_in_bloc.dart';
import 'models/sign_up_sign_in_model.dart';
import 'package:flutter/material.dart';
import 'package:snehal_s_application64/core/app_export.dart';
import 'package:snehal_s_application64/widgets/custom_button.dart';

class SignUpSignInScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return BlocProvider<SignUpSignInBloc>(
        create: (context) => SignUpSignInBloc(
            SignUpSignInState(signUpSignInModelObj: SignUpSignInModel()))
          ..add(SignUpSignInInitialEvent()),
        child: SignUpSignInScreen());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpSignInBloc, SignUpSignInState>(
        builder: (context, state) {
      return SafeArea(
          child: Scaffold(
              backgroundColor: ColorConstant.gray100,
              body: Container(
                  width: double.maxFinite,
                  padding: getPadding(left: 16, top: 50, right: 16, bottom: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomImageView(
                            imagePath:
                                ImageConstant.imgUnsplashw7b3edub2i299x299,
                            height: getSize(299),
                            width: getSize(299),
                            radius:
                                BorderRadius.circular(getHorizontalSize(149)),
                            margin: getMargin(top: 23)),
                        Container(
                            width: getHorizontalSize(186),
                            margin: getMargin(top: 81),
                            child: Text("msg_discover_your_s".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtPoppinsMedium25)),
                        Container(
                            width: getHorizontalSize(304),
                            margin: getMargin(left: 20, top: 13, right: 19),
                            child: Text("msg_it_is_a_long_es".tr,
                                maxLines: null,
                                textAlign: TextAlign.center,
                                style: AppStyle.txtPoppinsRegular15)),
                        Padding(
                            padding: getPadding(top: 48),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomButton(
                                      height: getVerticalSize(52),
                                      width: getHorizontalSize(164),
                                      text: "lbl_register".tr,
                                      onTap: () {
                                        signIn(context);
                                      }),
                                  CustomButton(
                                      height: getVerticalSize(52),
                                      width: getHorizontalSize(163),
                                      text: "lbl_sign_in".tr,
                                      variant: ButtonVariant.FillGray200,
                                      fontStyle: ButtonFontStyle
                                          .PoppinsMedium16Black900_1,
                                      onTap: () {
                                        onTapSignin(context);
                                      })
                                ]))
                      ]))));
    });
  }

  signIn(BuildContext context) {
    context.read<SignUpSignInBloc>().add(
          CreateRegisterEvent(),
        );
  }

  onTapSignin(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.signInScreen,
    );
  }
}
