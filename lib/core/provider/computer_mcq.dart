import 'package:engineering_guru/core/models/computer_QAModel.dart';
import 'package:engineering_guru/core/services/computerServices.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mcqprovides = Provider<MCQServices>((ref) => MCQServices());

final mcqdataProvider = FutureProvider<List<ComputerMCQModel>>(
    (ref) => ref.read(mcqprovides).getmcq());
