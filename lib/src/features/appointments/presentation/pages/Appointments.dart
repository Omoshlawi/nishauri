import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nishauri/src/features/hiv/presentation/pages/appointments/ARTAppointments.dart';
import 'package:nishauri/src/features/user_programs/data/models/user_program.dart';
import 'package:nishauri/src/features/user_programs/data/providers/program_provider.dart';
import 'package:nishauri/src/utils/routes.dart';

class Appointments extends ConsumerWidget {
  const Appointments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPrograms = ref.watch(programProvider);

    return userPrograms.when(
      data: (data) {
        final programsWithAppointments = data
            .where(_hasAppointData);
        return DefaultTabController(
          length: programsWithAppointments.length,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.chevron_left),
              ),
              title: const Text("Appointments"),
              bottom: TabBar(
                tabs: [
                  ...programsWithAppointments
                      .map(_getProgramTabBar)
                      .toList(),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ...programsWithAppointments
                    .map(_getProgramAppointments)
                    .toList(),
              ],
            ),
          ),
        );
      },
      error: (error, _) => Center(child: Text(error.toString())),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

bool _hasAppointData(UserProgram program) {
  final codes = [
    ProgramCodeNames.HIV,
  ];
  return codes.any((code) => code == program.program.programCode);
}

Tab _getProgramTabBar(UserProgram program) {
  final programCode = program.program.programCode;
  if (programCode == ProgramCodeNames.HIV) {
    return const Tab(
      text: "ART",
    );
  }
  return Tab(
    // icon: const Icon(Icons.directions_car),
    text: program.program.name,
  );
}

Widget _getProgramAppointments(UserProgram program) {
  final programCode = program.program.programCode;
  if (programCode == ProgramCodeNames.HIV) {
    return const ARTAppointmentsScreen();
  }
  return Center(child: Text(program.program.name));
}