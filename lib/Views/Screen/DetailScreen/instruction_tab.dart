import 'package:flutter/material.dart';
import 'package:pilot_app/Helper/app_color.dart';
import 'package:pilot_app/Helper/app_text_style.dart';
import 'package:pilot_app/Models/instruction.dart';
import 'package:pilot_app/ViewModels/instruction_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InstructionTab extends StatefulWidget {
  final int id;
  final InstructionViewModel instructionViewModel;

  const InstructionTab(this.instructionViewModel, this.id, {Key? key}) : super(key: key);


  @override
  _InstructionTabState createState() => _InstructionTabState();
}

class _InstructionTabState extends State<InstructionTab> {
  @override
  void initState() {
    super.initState();
    widget.instructionViewModel.getInstruction(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: StreamBuilder<Instruction>(
        stream: widget.instructionViewModel.instructionSubject,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final data = snapshot.data;
              if (data == null) {
                return Center(
                  child: Text(AppLocalizations.of(context)?.noData ?? ''),
                );
              } else {
                if (data.steps.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context)?.noData ?? ''),
                  );
                }
                return ListView.builder(
                    itemCount: data.steps.length,
                    itemBuilder: (context, index) {
                      return itemLisview(index, data);
                    });
              }
            } else if (snapshot.hasError) {
              return Center(
                child: Text(AppLocalizations.of(context)?.hasError ?? ''),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text(AppLocalizations.of(context)?.hasError ?? ''),
            );
          }
        },
      ),
    );

  }
  Container itemLisview(int index, Instruction data) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        border: Border.all(color: AppColor.black38p),
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                (Icons.check_circle),
                color: AppColor.shamrockGreen,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${AppLocalizations.of(context)?.step ?? ''} ${data.steps[index].step}',
                    style: AppTextStyle.descriptionStyle,
                  ),
                  Text(
                    data.name ?? '',
                    style: AppTextStyle.titleStyle
                        .copyWith(color: AppColor.shamrockGreen),
                  ),
                ],
              )
            ],
          ),
          Container(
            child: Text(
              data.steps[index].description ?? '',
              style: AppTextStyle.descriptionStyle,
            ),
          )
        ],
      ),
    );
  }

}