// import 'package:untitled/features/property/manage/state_project.dart';
// import '../../../data/repository/repositories_property.dart';
// import 'event_project.dart';
//
// class RealStateBloc extends Bloc<RealStateEvent, RealStateState> {
//   final RealStateRepository repository;
//
//   RealStateBloc({required this.repository}) : super(RealStateInitial()) {
//     on<LoadRealStates>((event, emit) async {
//       emit(RealStateLoading());
//       try {
//         final realStates = await repository.fetchAll();
//         emit(RealStateLoaded(realStates));
//       } catch (e) {
//         emit(RealStateError(e.toString()));
//       }
//     });
//   }
// }
