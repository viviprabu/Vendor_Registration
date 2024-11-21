class ApiUrls {
  // static const baseURL = 'https://cqp9mssl-7045.euw.devtunnels.ms/MEW/';
  static const baseURL = 'https://gqll1rmk-7045.euw.devtunnels.ms/MEW/';

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

  static const createDept = 'System/Department';
  static const department = 'System/Department';
  static const getDept = 'System/Department';
  static const updateDept = 'System/Department';

  static const createSection = 'System/Section';
  static const section = 'System/Section';
  static const getSection = 'System/Section';
  static const updateSection = 'System/Section';

  static const createAppList = 'Authentication';
  static const appList = 'Authentication';
  static const getAppList = 'Authentication';
  static const updateAppList = 'Authentication';

  static const createAppSetting = 'System/ApplicationSettings';
  static const appSetting = 'System/ApplicationSettings';
  static const getAppSetting = 'System/ApplicationSettings';
  static const updateAppSetting = 'System/ApplicationSettings';

  static const createSetting = 'System/Settings';
  static const setting = 'System/Settings';
  static const getSetting = 'System/Settings';
  static const updateSetting = 'System/Settings';

  // manage role
  static const createRole = 'System/Role';
  static const listRoles = 'System/Roles';
  static const getRole = 'System/UserRoleFunctions';
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

  // manage request status
  static const createRequestStatus = 'System/RequestStatus';
  static const listRequestStatus = 'System/RequestStatuses';
  static const getRequestStatus = 'System/RequestStatus';
  static const updateRequestStatus = 'System/RequestStatus';
  static const deleteRequestStatus = 'System/RequestStatus';
}
