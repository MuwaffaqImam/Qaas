part of 'tenants_bloc.dart';

@immutable
abstract class TenantsEvent {}

class TenantList extends TenantsEvent {}

class TenantBranches extends TenantsEvent {}

class TenantServices extends TenantsEvent {}
