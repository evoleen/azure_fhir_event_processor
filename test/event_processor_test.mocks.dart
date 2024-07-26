// Mocks generated by Mockito 5.4.4 from annotations
// in azure_fhir_event_processor/test/event_processor_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:azure_fhir_event_processor/azure_fhir_event_processor.dart'
    as _i2;
import 'package:mockito/mockito.dart' as _i1;

import 'mocks.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeHandlerResult_0 extends _i1.SmartFake implements _i2.HandlerResult {
  _FakeHandlerResult_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AzureMessageClient].
///
/// See the documentation for Mockito's code generation for more information.
class MockAzureMessageClient extends _i1.Mock
    implements _i2.AzureMessageClient {
  MockAzureMessageClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> sanitizeMessage(
          {required _i2.FhirMessage? fhirPoisonedMessage}) =>
      (super.noSuchMethod(
        Invocation.method(
          #sanitizeMessage,
          [],
          {#fhirPoisonedMessage: fhirPoisonedMessage},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<bool> queueIsNotEmpty() => (super.noSuchMethod(
        Invocation.method(
          #queueIsNotEmpty,
          [],
        ),
        returnValue: _i3.Future<bool>.value(false),
      ) as _i3.Future<bool>);

  @override
  _i3.Future<void> removeMessage({required _i2.FhirMessage? fhirMessage}) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeMessage,
          [],
          {#fhirMessage: fhirMessage},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);

  @override
  _i3.Future<List<_i2.FhirMessage>> consumeMessages(
          {required int? messagesCount}) =>
      (super.noSuchMethod(
        Invocation.method(
          #consumeMessages,
          [],
          {#messagesCount: messagesCount},
        ),
        returnValue:
            _i3.Future<List<_i2.FhirMessage>>.value(<_i2.FhirMessage>[]),
      ) as _i3.Future<List<_i2.FhirMessage>>);
}

/// A class which mocks [TmpValidator].
///
/// See the documentation for Mockito's code generation for more information.
class MockTmpValidator extends _i1.Mock implements _i4.TmpValidator {
  MockTmpValidator() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void validate({required _i2.FhirMessage? fhirMessage}) => super.noSuchMethod(
        Invocation.method(
          #validate,
          [],
          {#fhirMessage: fhirMessage},
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.Future<_i2.HandlerResult> handleException({
    required _i2.FhirMessage? fhirMessage,
    required _i2.AbstractFhirMessageClient? messageClient,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #handleException,
          [],
          {
            #fhirMessage: fhirMessage,
            #messageClient: messageClient,
          },
        ),
        returnValue: _i3.Future<_i2.HandlerResult>.value(_FakeHandlerResult_0(
          this,
          Invocation.method(
            #handleException,
            [],
            {
              #fhirMessage: fhirMessage,
              #messageClient: messageClient,
            },
          ),
        )),
      ) as _i3.Future<_i2.HandlerResult>);
}

/// A class which mocks [DeleteActionExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteActionExecutor extends _i1.Mock
    implements _i4.DeleteActionExecutor {
  MockDeleteActionExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required _i2.FhirEvent? fhirEvent}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#fhirEvent: fhirEvent},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [UpdateActionExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateActionExecutor extends _i1.Mock
    implements _i4.UpdateActionExecutor {
  MockUpdateActionExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required _i2.FhirEvent? fhirEvent}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#fhirEvent: fhirEvent},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [CreateActionExecutor].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateActionExecutor extends _i1.Mock
    implements _i4.CreateActionExecutor {
  MockCreateActionExecutor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> execute({required _i2.FhirEvent? fhirEvent}) =>
      (super.noSuchMethod(
        Invocation.method(
          #execute,
          [],
          {#fhirEvent: fhirEvent},
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}

/// A class which mocks [TmpPostProcessor].
///
/// See the documentation for Mockito's code generation for more information.
class MockTmpPostProcessor extends _i1.Mock implements _i4.TmpPostProcessor {
  MockTmpPostProcessor() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<void> apply({
    required _i2.FhirMessage? fhirMessage,
    required _i2.AbstractFhirMessageClient? messageClient,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #apply,
          [],
          {
            #fhirMessage: fhirMessage,
            #messageClient: messageClient,
          },
        ),
        returnValue: _i3.Future<void>.value(),
        returnValueForMissingStub: _i3.Future<void>.value(),
      ) as _i3.Future<void>);
}
