part of 'tenants_bloc.dart';

@immutable
abstract class TenantsState {}

class TenantsLoading extends TenantsState {}

class TenantsFailure extends TenantsState {}

class TenantsSuccess extends TenantsState {
  final List<Tenant> tenantsList;

  TenantsSuccess(this.tenantsList);
}
