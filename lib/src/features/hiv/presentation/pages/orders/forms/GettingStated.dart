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
  final ARTAppointment? artAppointment;
  final ARTEvent? artEvent;
  final String? type;

  const GettingStarted(
      {super.key, this.artEvent, this.artAppointment, this.type});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncARTAppointments = ref.watch(artAppointmentProvider);
    final asyncARTEvents = ref.watch(art_event_provider);
    final asyncARTTreatmentSupport = ref.watch(artTreatmentSupportProvider);
    final orderType = useState<String?>(type);
    final orderMode = useState<String?>(artEvent != null
        ? "event"
        : artAppointment != null
            ? "appointment"
            : null);
    return Column(
      children: [
        FormBuilderRadioGroup<String>(
            name: 'mode',
            initialValue: artEvent != null
                ? "event"
                : artAppointment != null
                    ? "appointment"
                    : null,
            onChanged: (mode_) {
              orderMode.value = mode_;
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Request based on",
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Required"),
            ]),
            options: const [
              FormBuilderFieldOption(
                value: "event",
                child: ListTile(
                  title: Text("Event"),
                ),
              ),
              FormBuilderFieldOption(
                value: "appointment",
                child: ListTile(
                  title: Text("Appointment"),
                ),
              ),
            ]),
        FormBuilderRadioGroup<String>(
            name: 'type',
            onChanged: (type_) {
              orderType.value = type_;
            },
            initialValue: type,
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelText: "Who are you requesting for?",
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: "Required"),
            ]),
            options: const [
              FormBuilderFieldOption(
                value: "self",
                child: ListTile(
                  title: Text("Yourself"),
                ),
              ),
              FormBuilderFieldOption(
                value: "other",
                child: ListTile(
                  title: Text("Care receiver"),
                ),
              ),
            ]),
        if (orderMode.value == "appointment")
          asyncARTAppointments.when(
            data: (appointment) => FormBuilderDropdown(
              name: "appointment",
              decoration: inputDecoration(
                prefixIcon: Icons.calendar_today,
                label: "Appointment",
              ),
              initialValue: artAppointment?.id,
              validator: FormBuilderValidators.compose([
                if (orderMode.value == "appointment")
                  FormBuilderValidators.required(errorText: "Required"),
              ]),
              items: appointment
                  .where((element) =>
                      element.appointmentType == "Re-Fill" &&
                      DateTime.parse(element.appointmentDate)
                              .difference(DateTime.now())
                              .inDays >=
                          0)
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.id,
                      child: Text(
                        "${e.appointmentType}(${DateFormat("dd MMM yyy").format(DateTime.parse(e.appointmentDate))})",
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
        if (orderMode.value == "event")
          asyncARTEvents.when(
            data: (events) => FormBuilderDropdown(
              initialValue: artEvent?.id,
              name: "event",
              decoration: inputDecoration(
                prefixIcon: Icons.calendar_today,
                label: "Event",
              ),
              validator: FormBuilderValidators.compose([
                if (orderMode.value == "event")
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
        if (orderType.value == "other")
          const SizedBox(height: Constants.SPACING),
        if (orderType.value == "other")
          asyncARTTreatmentSupport.when(
            data: (supports) => FormBuilderDropdown(
              name: "careReceiver",
              decoration: inputDecoration(
                prefixIcon: Icons.person,
                label: "Care receiver",
              ),
              validator: FormBuilderValidators.compose([
                if (orderType.value == "other")
                  FormBuilderValidators.required(errorText: "Required"),
              ]),
              items: supports
                  // TODO Filter only where curr user is care giver
                  .where((element) => true)
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.careReceiver.cccNumber,
                      child: Text(
                        "${e.careReceiver.name}(${e.careReceiver.cccNumber})",
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
