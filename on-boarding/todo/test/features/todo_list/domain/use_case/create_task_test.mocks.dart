// Mocks generated by Mockito 5.4.2 from annotations
// in todo/test/features/todo_list/domain/use_case/create_task_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:todo/core/error/failures.dart' as _i5;
import 'package:todo/features/todo_list/domain/entity/tasks.dart' as _i6;
import 'package:todo/features/todo_list/domain/repositories/todo_list_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TodoListRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockTodoListRepository extends _i1.Mock
    implements _i3.TodoListRepository {
  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tasks>>> viewAllTasks() =>
      (super.noSuchMethod(
        Invocation.method(
          #viewAllTasks,
          [],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tasks>>>.value(
            _FakeEither_0<_i5.Failure, List<_i6.Tasks>>(
          this,
          Invocation.method(
            #viewAllTasks,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tasks>>>.value(
                _FakeEither_0<_i5.Failure, List<_i6.Tasks>>(
          this,
          Invocation.method(
            #viewAllTasks,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, List<_i6.Tasks>>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>> viewSpecificTask(
          String? taskId) =>
      (super.noSuchMethod(
        Invocation.method(
          #viewSpecificTask,
          [taskId],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>.value(
            _FakeEither_0<_i5.Failure, _i6.Tasks>(
          this,
          Invocation.method(
            #viewSpecificTask,
            [taskId],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>.value(
                _FakeEither_0<_i5.Failure, _i6.Tasks>(
          this,
          Invocation.method(
            #viewSpecificTask,
            [taskId],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>> createTask(_i6.Tasks? tasks) =>
      (super.noSuchMethod(
        Invocation.method(
          #createTask,
          [tasks],
        ),
        returnValue: _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>.value(
            _FakeEither_0<_i5.Failure, _i6.Tasks>(
          this,
          Invocation.method(
            #createTask,
            [tasks],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>.value(
                _FakeEither_0<_i5.Failure, _i6.Tasks>(
          this,
          Invocation.method(
            #createTask,
            [tasks],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.Tasks>>);
}
