// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MemberLandingEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAbout,
    required TResult Function(int id) fetchMemberDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAbout,
    TResult? Function(int id)? fetchMemberDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAbout,
    TResult Function(int id)? fetchMemberDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAbout value) fetchAbout,
    required TResult Function(FetchMemberDetail value) fetchMemberDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAbout value)? fetchAbout,
    TResult? Function(FetchMemberDetail value)? fetchMemberDetail,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAbout value)? fetchAbout,
    TResult Function(FetchMemberDetail value)? fetchMemberDetail,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberLandingEventCopyWith<$Res> {
  factory $MemberLandingEventCopyWith(
          MemberLandingEvent value, $Res Function(MemberLandingEvent) then) =
      _$MemberLandingEventCopyWithImpl<$Res, MemberLandingEvent>;
}

/// @nodoc
class _$MemberLandingEventCopyWithImpl<$Res, $Val extends MemberLandingEvent>
    implements $MemberLandingEventCopyWith<$Res> {
  _$MemberLandingEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberLandingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchAboutImplCopyWith<$Res> {
  factory _$$FetchAboutImplCopyWith(
          _$FetchAboutImpl value, $Res Function(_$FetchAboutImpl) then) =
      __$$FetchAboutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchAboutImplCopyWithImpl<$Res>
    extends _$MemberLandingEventCopyWithImpl<$Res, _$FetchAboutImpl>
    implements _$$FetchAboutImplCopyWith<$Res> {
  __$$FetchAboutImplCopyWithImpl(
      _$FetchAboutImpl _value, $Res Function(_$FetchAboutImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FetchAboutImpl implements FetchAbout {
  const _$FetchAboutImpl();

  @override
  String toString() {
    return 'MemberLandingEvent.fetchAbout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchAboutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAbout,
    required TResult Function(int id) fetchMemberDetail,
  }) {
    return fetchAbout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAbout,
    TResult? Function(int id)? fetchMemberDetail,
  }) {
    return fetchAbout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAbout,
    TResult Function(int id)? fetchMemberDetail,
    required TResult orElse(),
  }) {
    if (fetchAbout != null) {
      return fetchAbout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAbout value) fetchAbout,
    required TResult Function(FetchMemberDetail value) fetchMemberDetail,
  }) {
    return fetchAbout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAbout value)? fetchAbout,
    TResult? Function(FetchMemberDetail value)? fetchMemberDetail,
  }) {
    return fetchAbout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAbout value)? fetchAbout,
    TResult Function(FetchMemberDetail value)? fetchMemberDetail,
    required TResult orElse(),
  }) {
    if (fetchAbout != null) {
      return fetchAbout(this);
    }
    return orElse();
  }
}

abstract class FetchAbout implements MemberLandingEvent {
  const factory FetchAbout() = _$FetchAboutImpl;
}

/// @nodoc
abstract class _$$FetchMemberDetailImplCopyWith<$Res> {
  factory _$$FetchMemberDetailImplCopyWith(_$FetchMemberDetailImpl value,
          $Res Function(_$FetchMemberDetailImpl) then) =
      __$$FetchMemberDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$FetchMemberDetailImplCopyWithImpl<$Res>
    extends _$MemberLandingEventCopyWithImpl<$Res, _$FetchMemberDetailImpl>
    implements _$$FetchMemberDetailImplCopyWith<$Res> {
  __$$FetchMemberDetailImplCopyWithImpl(_$FetchMemberDetailImpl _value,
      $Res Function(_$FetchMemberDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchMemberDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FetchMemberDetailImpl implements FetchMemberDetail {
  const _$FetchMemberDetailImpl(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'MemberLandingEvent.fetchMemberDetail(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchMemberDetailImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MemberLandingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchMemberDetailImplCopyWith<_$FetchMemberDetailImpl> get copyWith =>
      __$$FetchMemberDetailImplCopyWithImpl<_$FetchMemberDetailImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAbout,
    required TResult Function(int id) fetchMemberDetail,
  }) {
    return fetchMemberDetail(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetchAbout,
    TResult? Function(int id)? fetchMemberDetail,
  }) {
    return fetchMemberDetail?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAbout,
    TResult Function(int id)? fetchMemberDetail,
    required TResult orElse(),
  }) {
    if (fetchMemberDetail != null) {
      return fetchMemberDetail(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FetchAbout value) fetchAbout,
    required TResult Function(FetchMemberDetail value) fetchMemberDetail,
  }) {
    return fetchMemberDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FetchAbout value)? fetchAbout,
    TResult? Function(FetchMemberDetail value)? fetchMemberDetail,
  }) {
    return fetchMemberDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FetchAbout value)? fetchAbout,
    TResult Function(FetchMemberDetail value)? fetchMemberDetail,
    required TResult orElse(),
  }) {
    if (fetchMemberDetail != null) {
      return fetchMemberDetail(this);
    }
    return orElse();
  }
}

abstract class FetchMemberDetail implements MemberLandingEvent {
  const factory FetchMemberDetail(final int id) = _$FetchMemberDetailImpl;

  int get id;

  /// Create a copy of MemberLandingEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchMemberDetailImplCopyWith<_$FetchMemberDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MemberLandingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberLandingStateCopyWith<$Res> {
  factory $MemberLandingStateCopyWith(
          MemberLandingState value, $Res Function(MemberLandingState) then) =
      _$MemberLandingStateCopyWithImpl<$Res, MemberLandingState>;
}

/// @nodoc
class _$MemberLandingStateCopyWithImpl<$Res, $Val extends MemberLandingState>
    implements $MemberLandingStateCopyWith<$Res> {
  _$MemberLandingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MemberInitialImplCopyWith<$Res> {
  factory _$$MemberInitialImplCopyWith(
          _$MemberInitialImpl value, $Res Function(_$MemberInitialImpl) then) =
      __$$MemberInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberInitialImplCopyWithImpl<$Res>
    extends _$MemberLandingStateCopyWithImpl<$Res, _$MemberInitialImpl>
    implements _$$MemberInitialImplCopyWith<$Res> {
  __$$MemberInitialImplCopyWithImpl(
      _$MemberInitialImpl _value, $Res Function(_$MemberInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MemberInitialImpl implements MemberInitial {
  const _$MemberInitialImpl();

  @override
  String toString() {
    return 'MemberLandingState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class MemberInitial implements MemberLandingState {
  const factory MemberInitial() = _$MemberInitialImpl;
}

/// @nodoc
abstract class _$$MemberLoadingImplCopyWith<$Res> {
  factory _$$MemberLoadingImplCopyWith(
          _$MemberLoadingImpl value, $Res Function(_$MemberLoadingImpl) then) =
      __$$MemberLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MemberLoadingImplCopyWithImpl<$Res>
    extends _$MemberLandingStateCopyWithImpl<$Res, _$MemberLoadingImpl>
    implements _$$MemberLoadingImplCopyWith<$Res> {
  __$$MemberLoadingImplCopyWithImpl(
      _$MemberLoadingImpl _value, $Res Function(_$MemberLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MemberLoadingImpl implements MemberLoading {
  const _$MemberLoadingImpl();

  @override
  String toString() {
    return 'MemberLandingState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MemberLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MemberLoading implements MemberLandingState {
  const factory MemberLoading() = _$MemberLoadingImpl;
}

/// @nodoc
abstract class _$$AboutLoadedImplCopyWith<$Res> {
  factory _$$AboutLoadedImplCopyWith(
          _$AboutLoadedImpl value, $Res Function(_$AboutLoadedImpl) then) =
      __$$AboutLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AboutMemberResponse memberRespons});
}

/// @nodoc
class __$$AboutLoadedImplCopyWithImpl<$Res>
    extends _$MemberLandingStateCopyWithImpl<$Res, _$AboutLoadedImpl>
    implements _$$AboutLoadedImplCopyWith<$Res> {
  __$$AboutLoadedImplCopyWithImpl(
      _$AboutLoadedImpl _value, $Res Function(_$AboutLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? memberRespons = null,
  }) {
    return _then(_$AboutLoadedImpl(
      null == memberRespons
          ? _value.memberRespons
          : memberRespons // ignore: cast_nullable_to_non_nullable
              as AboutMemberResponse,
    ));
  }
}

/// @nodoc

class _$AboutLoadedImpl implements AboutLoaded {
  const _$AboutLoadedImpl(this.memberRespons);

  @override
  final AboutMemberResponse memberRespons;

  @override
  String toString() {
    return 'MemberLandingState.aboutLoaded(memberRespons: $memberRespons)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutLoadedImpl &&
            (identical(other.memberRespons, memberRespons) ||
                other.memberRespons == memberRespons));
  }

  @override
  int get hashCode => Object.hash(runtimeType, memberRespons);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutLoadedImplCopyWith<_$AboutLoadedImpl> get copyWith =>
      __$$AboutLoadedImplCopyWithImpl<_$AboutLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) {
    return aboutLoaded(memberRespons);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) {
    return aboutLoaded?.call(memberRespons);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (aboutLoaded != null) {
      return aboutLoaded(memberRespons);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) {
    return aboutLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) {
    return aboutLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) {
    if (aboutLoaded != null) {
      return aboutLoaded(this);
    }
    return orElse();
  }
}

abstract class AboutLoaded implements MemberLandingState {
  const factory AboutLoaded(final AboutMemberResponse memberRespons) =
      _$AboutLoadedImpl;

  AboutMemberResponse get memberRespons;

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutLoadedImplCopyWith<_$AboutLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MemberDetailLoadedImplCopyWith<$Res> {
  factory _$$MemberDetailLoadedImplCopyWith(_$MemberDetailLoadedImpl value,
          $Res Function(_$MemberDetailLoadedImpl) then) =
      __$$MemberDetailLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User member});
}

/// @nodoc
class __$$MemberDetailLoadedImplCopyWithImpl<$Res>
    extends _$MemberLandingStateCopyWithImpl<$Res, _$MemberDetailLoadedImpl>
    implements _$$MemberDetailLoadedImplCopyWith<$Res> {
  __$$MemberDetailLoadedImplCopyWithImpl(_$MemberDetailLoadedImpl _value,
      $Res Function(_$MemberDetailLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? member = null,
  }) {
    return _then(_$MemberDetailLoadedImpl(
      null == member
          ? _value.member
          : member // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$MemberDetailLoadedImpl implements MemberDetailLoaded {
  const _$MemberDetailLoadedImpl(this.member);

  @override
  final User member;

  @override
  String toString() {
    return 'MemberLandingState.memberDetailLoaded(member: $member)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberDetailLoadedImpl &&
            (identical(other.member, member) || other.member == member));
  }

  @override
  int get hashCode => Object.hash(runtimeType, member);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberDetailLoadedImplCopyWith<_$MemberDetailLoadedImpl> get copyWith =>
      __$$MemberDetailLoadedImplCopyWithImpl<_$MemberDetailLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) {
    return memberDetailLoaded(member);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) {
    return memberDetailLoaded?.call(member);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (memberDetailLoaded != null) {
      return memberDetailLoaded(member);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) {
    return memberDetailLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) {
    return memberDetailLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) {
    if (memberDetailLoaded != null) {
      return memberDetailLoaded(this);
    }
    return orElse();
  }
}

abstract class MemberDetailLoaded implements MemberLandingState {
  const factory MemberDetailLoaded(final User member) =
      _$MemberDetailLoadedImpl;

  User get member;

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberDetailLoadedImplCopyWith<_$MemberDetailLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MemberErrorImplCopyWith<$Res> {
  factory _$$MemberErrorImplCopyWith(
          _$MemberErrorImpl value, $Res Function(_$MemberErrorImpl) then) =
      __$$MemberErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$MemberErrorImplCopyWithImpl<$Res>
    extends _$MemberLandingStateCopyWithImpl<$Res, _$MemberErrorImpl>
    implements _$$MemberErrorImplCopyWith<$Res> {
  __$$MemberErrorImplCopyWithImpl(
      _$MemberErrorImpl _value, $Res Function(_$MemberErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$MemberErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MemberErrorImpl implements MemberError {
  const _$MemberErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'MemberLandingState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberErrorImplCopyWith<_$MemberErrorImpl> get copyWith =>
      __$$MemberErrorImplCopyWithImpl<_$MemberErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(AboutMemberResponse memberRespons) aboutLoaded,
    required TResult Function(User member) memberDetailLoaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult? Function(User member)? memberDetailLoaded,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(AboutMemberResponse memberRespons)? aboutLoaded,
    TResult Function(User member)? memberDetailLoaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MemberInitial value) initial,
    required TResult Function(MemberLoading value) loading,
    required TResult Function(AboutLoaded value) aboutLoaded,
    required TResult Function(MemberDetailLoaded value) memberDetailLoaded,
    required TResult Function(MemberError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MemberInitial value)? initial,
    TResult? Function(MemberLoading value)? loading,
    TResult? Function(AboutLoaded value)? aboutLoaded,
    TResult? Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult? Function(MemberError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MemberInitial value)? initial,
    TResult Function(MemberLoading value)? loading,
    TResult Function(AboutLoaded value)? aboutLoaded,
    TResult Function(MemberDetailLoaded value)? memberDetailLoaded,
    TResult Function(MemberError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MemberError implements MemberLandingState {
  const factory MemberError(final String message) = _$MemberErrorImpl;

  String get message;

  /// Create a copy of MemberLandingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberErrorImplCopyWith<_$MemberErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
