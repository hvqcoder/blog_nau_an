import 'package:pilot_app/Models/instruction.dart';
import 'package:pilot_app/Service/instruction_data_source.dart';
import 'package:rxdart/rxdart.dart';

class InstructionViewModel {
  BehaviorSubject<Instruction> instructionSubject = BehaviorSubject();

  InstructionDataSource req = InstructionDataSource();

  InstructionViewModel();

  void getInstruction(int id) async {
    Instruction instruction = await req.getInstruction(id: id);
    instructionSubject.sink.add(instruction);
  }

  void dispose() {
    instructionSubject.close();
  }
}
