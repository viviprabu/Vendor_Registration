class ApiUrls {
  // static const baseURL = 'https://cqp9mssl-7045.euw.devtunnels.ms/MEW/';
  static const baseURL = 'https://zzcxbndp-7045.inc1.devtunnels.ms/';

  static const applicationId = '0';
  // Manage User
  static const userProfile = 'Authentication/UserDetail';
  static const login = 'Authentication/login';
  static const users = 'Authentication/UserList';
  static const createUser = 'Authentication';
  static const updateUser = 'Authentication/edit';

  // manage sector
  static const listSectors = 'System/Sector';
  static const createUpdateSector = 'System/Sector';
  static const getSector = 'System/Sector';

  static const createRegistration = 'System/Registration';
  static const registration = 'System/Registration';
  static const getRegistration = 'System/Registration';
  static const updateRegistration = 'System/Registration';

  // manage role
  static const createRole = 'System/Role';
  static const listRoles = 'System/Roles';
  static const getRoleFunctions = 'System/UserRoleFunctions';
  static const updateRole = 'System/Role';
  static const listSystemFunctions = 'System/SystemFunctions';

  static const createInitialUpload = 'System/InitialUpload';
  static const initialUpload = 'System/InitialUpload';
  static const getInitialUpload = 'System/InitialUpload';
  static const updateInitialUpload = 'System/InitialUpload';

  static const createAssignedList = 'System/AssignedList';
  static const assignedList = 'System/AssignedList';
  static const getAssignedList = 'System/AssignedList';
  static const updateAssignedList = 'System/AssignedList';

  static const createInitialRequest = 'System/InitialRequest';
  static const initialRequest = 'System/InitialRequest';
  static const getInitialRequest = 'System/InitialRequest';
  static const updateInitialRequest = 'System/InitialRequest';

  // manage request status
  static const createRequestStatus = 'System/RequestStatus';
  static const listRequestStatus = 'System/RequestStatuses';
  static const getRequestStatus = 'System/RequestStatus';
  static const updateRequestStatus = 'System/RequestStatus';
  static const deleteRequestStatus = 'System/RequestStatus';
}
