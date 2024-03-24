import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:nishauri/src/features/hiv/data/models/appointment/art_appointment.dart';
import 'package:nishauri/src/features/hiv/data/models/event/art_event.dart';
import 'package:nishauri/src/features/hiv/data/providers/art_appointmen_provider.dart';
import 'package:nishauri/src/features/hiv/data/providers/art_events_provider.dart';
import 'package:nishauri/src/features/hiv/data/providers/art_treatment_Support_provider.dart';
import 'package:nishauri/src/shared/styles/input_styles.dart';
import 'package:nishauri/src/utils/constants.dart';

class GettingStarted extends HookConsumerWidget {
  final ARTEvent? artEvent;

  const GettingStarted(
      {super.key, this.artEvent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncARTAppointments = ref.watch(artAppointmentProvider);
    final asyncARTEvents = ref.watch(art_event_provider);

    final currentEvent = useState(artEvent);


    return Column(
      children: [
          asyncARTEvents.when(
            data: (events) => FormBuilderDropdown(
              initialValue: currentEvent.value?.id,
              name: "event",
              decoration: inputDecoration(
                prefixIcon: Icons.calendar_today,
                label: "Event",
              ),
              validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(errorText: "Required"),
              ]),
              items: events
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(
                        "${e.title}(${DateFormat("dd MMM yyy").format(DateTime.parse(e.distributionTime))})",
                      ),
                    ),
                  )
                  .toList(),
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        const SizedBox(height: Constants.SPACING),
        if(currentEvent.value != null)
          asyncARTEvents.when(
            data: (events) => FormBuilderDropdown(
              name: "subscriber",
              decoration: inputDecoration(
                prefixIcon: Icons.person,
                label: "Event Subscriber",
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(errorText: "Required"),
              ]),
              items: events.where((element) => element.id == currentEvent.value?.id).elementAt(0).group.enrollments
                  .map(
                    (e) => DropdownMenuItem(
                  value: e.id,
                  child: Text(
                    "${e.user.id}(CCCNumber)",
                  ),
                ),
              )
                  .toList(),
            ),
            error: (error, _) => Center(child: Text(error.toString())),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        const SizedBox(height: Constants.SPACING),
      ],
    );
  }
}
