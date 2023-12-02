import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nishauri/src/features/auth/data/providers/auth_provider.dart';
import 'package:nishauri/src/features/user/data/models/user.dart';
import 'package:nishauri/src/features/user/data/providers/user_provider.dart';
import 'package:nishauri/src/features/user/presentation/forms/forms.dart';
import 'package:nishauri/src/shared/exeptions/http_exceptions.dart';
import 'package:nishauri/src/shared/input/Button.dart';
import 'package:nishauri/src/utils/constants.dart';
import 'package:nishauri/src/utils/helpers.dart';
import 'package:nishauri/src/utils/routes.dart';

class ProfileWizardFormScreen extends HookConsumerWidget {
  const ProfileWizardFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormBuilderState>());
    final currentStep = useState<int>(0);
    final theme = Theme.of(context);
    final loading = useState<bool>(false);

    final stepFieldsToValidate = [
      ["image", "username"],
      ["firstName", "lastName", "dateOfBirth", "gender"],
      ["email", "phoneNumber", "country", "constituency"],
      ["bloodGroup", "allergies", "disabilities", "chronics"],
      ["weight", "height"],
      ["maritalStatus", "educationLevel", "primaryLanguage", "occupation"],
    ];

    List<Step> steps = [
      Step(
        title: const Text("Account setup"),
        subtitle: const Text(
          "Create your account to personalize your healthcare experience.",
        ),
        content: const AccountInformation(),
        isActive: currentStep.value == 0,
      ),
      Step(
        title: const Text("Personal Information"),
        subtitle: const Text(
          "Provide basic personal details for a comprehensive profile.",
        ),
        content: const PersonalInformation(),
        isActive: currentStep.value == 1,
      ),
      Step(
        title: const Text("Contact Details"),
        subtitle: const Text(
            "Share your contact information for communication purposes."),
        content: const ContactInformation(),
        isActive: currentStep.value == 2,
      ),
      Step(
        title: const Text("Health Information"),
        subtitle: const Text(
            " Share important health details for better healthcare assistance."),
        content: const HealthInformation(),
        isActive: currentStep.value == 3,
      ),
      Step(
        title: const Text("Physical Characteristics"),
        subtitle: const Text(
            "Provide information about your physical attributes for a more comprehensive"),
        content: const PhysicalCharacteristicInformation(),
        isActive: currentStep.value == 4,
      ),
      Step(
        title: const Text("Social Information"),
        subtitle: const Text(
            "Share aspects of your lifestyle that may influence your health."),
        content: const LifeStyleInformation(),
        isActive: currentStep.value == 5,
      ),
      Step(
        title: const Text("Review and Submit"),
        subtitle: const Text(
          "Thank you for completing your patient profile! Your information will help us provide you with better healthcare."
          "Review your information for accuracy before submission.",
        ),
        content: ReviewAndSubmit(formKey: formKey),
        isActive: currentStep.value == 6,
      ),
    ];

    void handleSubmit() {


      if (formKey.currentState!.validate()) {
        loading.value = true;
        final dateOfBirth = formKey.currentState!.value["dateOfBirth"];
        ref
            .read(userProvider.notifier)
            .updateUser(User.fromJson({
              ...formKey.currentState!.instantValue,
              "dateOfBirth": dateOfBirth is DateTime
                  ? dateOfBirth.toIso8601String()
                  : dateOfBirth
            }))
            .then((value) {
          return ref.read(authStateProvider.notifier).markProfileAsUpdated();
        }).then((value) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Profile updated successfully!")));
        }).catchError((e) {
          switch (e) {
            case ValidationException e:
              handleResponseError(context, formKey.currentState!.fields, e);
              //   Navigate to 1st step with the error
              final fieldStep = stepFieldsToValidate.indexWhere(
                  (fields) => fields.any((field) => e.errors.containsKey(field)));
              currentStep.value = fieldStep;
              break;
            default:
              debugPrint("[PROFILE-WIZARD]: ${e.toString()}");
          }
        }).whenComplete(() => loading.value = false);
      } else {
        //   if invalid then navigate to the 1st step with errors
        final fieldStep = stepFieldsToValidate.indexWhere((fields) => fields
            .any((field) => formKey.currentState!.fields[field]!.hasError));
        currentStep.value = fieldStep;
      }
    }

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Consumer(
            builder: (context, ref, child) {
              final authState = ref.watch(authStateProvider);
              return IconButton(
                onPressed: () {
                  try {
                    if (authState.isProfileComplete) {
                      context.goNamed(RouteNames.PROFILE_SETTINGS);
                    }
                  } on GoError catch (e) {
                    debugPrint("[DEBUG-PROFILE-WIZARD]: $e");
                  }
                },
                icon: const Icon(Icons.chevron_left),
              );
            },
          ),
          title: const Text("Update profile"),
        ),
        body: SafeArea(
          child: FormBuilder(
            key: formKey,
            child: Stepper(
              currentStep: currentStep.value,
              onStepCancel: () {
                currentStep.value == 0 ? null : currentStep.value -= 1;
              },
              onStepContinue: () {

                bool isLastStep = (currentStep.value == steps.length - 1);
                // 1.validate current step fields and prevent continue encase of any error in current step
                if (!isLastStep) {
                  final currentStepFields =
                      stepFieldsToValidate[currentStep.value];

                  if (currentStepFields.any((field) =>
                      !formKey.currentState!.fields[field]!.validate())) {
                    return; //Don't move to next step if current step not valid
                  }
                }
                if (isLastStep) {
                  // Submit form
                  handleSubmit();
                } else {
                  currentStep.value += 1;
                }
              },
              onStepTapped: (step) {
                currentStep.value = step;
              },
              steps: steps,
              controlsBuilder: (context, details) {
                return Row(
                  children: [
                    Expanded(
                      child: Builder(builder: (context) {
                        bool isLastStep =
                            (currentStep.value == steps.length - 1);
                        if (isLastStep) {
                          return Button(
                            onPress: details.onStepContinue,
                            title: 'Submit',
                            loading: loading.value,
                            titleStyle: theme.textTheme.titleSmall?.copyWith(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }
                        return Button(
                          onPress: details.onStepContinue,
                          title: 'Next',
                          disabled: loading.value,
                          titleStyle: theme.textTheme.titleSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: Constants.SPACING),
                    Expanded(
                      child: Button(
                        onPress: details.onStepCancel,
                        title: 'Cancel',
                        disabled: loading.value,
                        titleStyle: theme.textTheme.titleSmall
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: Constants.SPACING),
                    Expanded(child: Container())
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
