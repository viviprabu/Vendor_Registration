// 🌎 Project imports:
import '../../../../generated/l10n.dart' as l;

class RouteBreadcrumbModel {
  final String title;
  final String parentRoute;
  final String childRoute;
  const RouteBreadcrumbModel({
    required this.title,
    required this.parentRoute,
    required this.childRoute,
  });

  @override
  String toString() {
    return 'RouteBreadcrumbModel(parentName: $parentRoute, childName: $childRoute)';
  }
}

Map<String, RouteBreadcrumbModel> get routerParam {
  return {
    '/dashboard/home': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'Home',
    ),
    '/widgets/general-widgets': RouteBreadcrumbModel(
      // title: 'General',
      title: l.S.current.general,
      parentRoute: 'Widgets',
      childRoute: 'General',
    ),
    '/widgets/chart-widgets': RouteBreadcrumbModel(
      //title: 'Chart',
      title: l.S.current.chart,
      parentRoute: 'Widgets',
      childRoute: 'Chart',
    ),
    '/calendar': RouteBreadcrumbModel(
      //title: 'Calendar',
      title: l.S.current.calendar,
      parentRoute: 'Application',
      childRoute: 'Calendar',
    ),
    '/chat': RouteBreadcrumbModel(
      //title: 'Chat',
      title: l.S.current.chat,
      parentRoute: 'Application',
      childRoute: 'Chat',
    ),
    '/email/inbox': RouteBreadcrumbModel(
      //title: 'Inbox',
      title: l.S.current.inbox,
      parentRoute: 'Application / Email',
      childRoute: 'Inbox',
    ),
    '/email/starred': RouteBreadcrumbModel(
      //title: 'Starred',
      title: l.S.current.starred,
      parentRoute: 'Application / Email',
      childRoute: 'Starred',
    ),
    '/email/sent': RouteBreadcrumbModel(
      //title: 'Sent',
      title: l.S.current.sent,
      parentRoute: 'Application / Email',
      childRoute: 'Sent',
    ),
    '/email/drafts': RouteBreadcrumbModel(
      // title: 'Drafts',
      title: l.S.current.drafts,
      parentRoute: 'Application / Email',
      childRoute: 'Drafts',
    ),
    '/email/spam': RouteBreadcrumbModel(
      //title: 'Spam',
      title: l.S.current.spam,
      parentRoute: 'Application / Email',
      childRoute: 'Spam',
    ),
    '/email/trash': RouteBreadcrumbModel(
      //title: 'Trash',
      title: l.S.current.trash,
      parentRoute: 'Application / Email',
      childRoute: 'Trash',
    ),
    '/email/details': RouteBreadcrumbModel(
      //title: 'Details',
      title: l.S.current.details,
      parentRoute: 'Application / Email',
      childRoute: 'Details',
    ),
    '/projects': RouteBreadcrumbModel(
      //title: 'Projects',
      title: l.S.current.projects,
      parentRoute: 'Application',
      childRoute: 'Projects',
    ),
    '/kanban': RouteBreadcrumbModel(
      // title: 'Kanban',
      title: l.S.current.kanban,
      parentRoute: 'Application',
      childRoute: 'Kanban',
    ),
    '/open-ai/ai-writter': RouteBreadcrumbModel(
      //title: 'AI Writer',
      title: l.S.current.aIWriter,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Writer',
    ),
    '/open-ai/ai-image': RouteBreadcrumbModel(
      //title: 'AI Image',
      title: l.S.current.aIImage,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Image',
    ),
    '/open-ai/ai-chat': RouteBreadcrumbModel(
      //title: 'AI Chat',
      title: l.S.current.aIChat,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Chat',
    ),
    '/open-ai/ai-code': RouteBreadcrumbModel(
      //title: 'AI Code',
      title: l.S.current.aICode,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Code',
    ),
    '/open-ai/ai-voiceover': RouteBreadcrumbModel(
      //title: 'AI Voiceover',
      title: l.S.current.aIVoiceover,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Voiceover',
    ),
    '/requests/initial_request': RouteBreadcrumbModel(
      //title: 'Users List',
      title: l.S.current.request,
      parentRoute: 'requests / initial_request',
      childRoute: 'Initial Request',
    ),
    '/request/request_list': RouteBreadcrumbModel(
      //title: 'Users List',
      title: l.S.current.requestlist,
      parentRoute: 'request / request',
      childRoute: 'Request List',
    ),
    '/users/user-list': RouteBreadcrumbModel(
      //title: 'Users List',
      title: l.S.current.usersList,
      parentRoute: 'Application / Users',
      childRoute: 'Users List',
    ),
    '/users/unauthorised-users': RouteBreadcrumbModel(
      //title: 'Users List',
      title: l.S.current.unauthorisedusersList,
      parentRoute: 'Application / Un Authorised Users',
      childRoute: 'Un Authorised Users',
    ),
    '/users/user-grid': RouteBreadcrumbModel(
      //title: 'Users Grid',
      title: l.S.current.usersGrid,
      parentRoute: 'Application / Users',
      childRoute: 'Users Grid',
    ),
    '/users/user-profile': RouteBreadcrumbModel(
      //title: 'User Profile',
      title: l.S.current.userProfile,
      parentRoute: 'Application / Users',
      childRoute: 'User Profile',
    ),
    '/tables/basic-table': RouteBreadcrumbModel(
      //title: 'Basic Table',
      title: l.S.current.basicTable,
      parentRoute: 'Tables & Forms',
      childRoute: 'Basic Table',
    ),
    '/tables/data-table': RouteBreadcrumbModel(
      //title: 'Data Table',
      title: l.S.current.dataTable,
      parentRoute: 'Tables & Forms',
      childRoute: 'Data Table',
    ),
    '/forms/basic-forms': RouteBreadcrumbModel(
      //title: 'Basic Forms',
      title: l.S.current.basicForms,
      parentRoute: 'Table & Forms',
      childRoute: 'Basic Forms',
    ),
    '/forms/form-select': RouteBreadcrumbModel(
      // title: 'Form Select',
      title: l.S.current.formSelect,
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Select',
    ),
    '/forms/form-validation': RouteBreadcrumbModel(
      //title: 'Form Validation',
      title: l.S.current.formValidation,
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Validation',
    ),
    '/components/buttons': RouteBreadcrumbModel(
      //title: 'Buttons',
      title: l.S.current.buttons,
      parentRoute: 'Components',
      childRoute: 'Buttons',
    ),
    '/components/colors': RouteBreadcrumbModel(
      //title: 'Colors',
      title: l.S.current.colors,
      parentRoute: 'Components',
      childRoute: 'Colors',
    ),
    '/components/alerts': RouteBreadcrumbModel(
      //title: 'Alerts',
      title: l.S.current.alerts,
      parentRoute: 'Components',
      childRoute: 'Alerts',
    ),
    '/components/typography': RouteBreadcrumbModel(
      //title: 'Typography',
      title: l.S.current.typography,
      parentRoute: 'Components',
      childRoute: 'Typography',
    ),
    '/components/cards': RouteBreadcrumbModel(
      //title: 'Cards',
      title: l.S.current.cards,
      parentRoute: 'Components',
      childRoute: 'Cards',
    ),
    '/components/avatars': RouteBreadcrumbModel(
      //title: 'Avatars',
      title: l.S.current.avatars,
      parentRoute: 'Components',
      childRoute: 'Avatars',
    ),
    '/components/dragndrop': RouteBreadcrumbModel(
      //title: 'Drag & Drop',
      title: l.S.current.dragDrop,
      parentRoute: 'Components',
      childRoute: 'Drag & Drop',
    ),
    '/pages/gallery': RouteBreadcrumbModel(
      //title: 'Gallery',
      title: l.S.current.gallery,
      parentRoute: 'Pages',
      childRoute: 'Gallery',
    ),
    '/pages/maps': RouteBreadcrumbModel(
      //title: 'Maps',
      title: l.S.current.maps,
      parentRoute: 'Pages',
      childRoute: 'Maps',
    ),
    '/pages/pricing': RouteBreadcrumbModel(
      //title: 'Pricing',
      title: l.S.current.pricing,
      parentRoute: 'Pages',
      childRoute: 'Pricing',
    ),
    '/pages/tabs-and-pills': RouteBreadcrumbModel(
      // title: 'Tabs & Pills',
      title: l.S.current.tabsPills,
      parentRoute: 'Pages',
      childRoute: 'Tabs & Pills',
    ),
    '/pages/faqs': RouteBreadcrumbModel(
      //title: 'FAQs',
      title: l.S.current.fAQs,
      parentRoute: 'Pages',
      childRoute: 'FAQs',
    ),
    '/pages/404': RouteBreadcrumbModel(
      //title: '404',
      title: l.S.current.error,
      parentRoute: 'Pages',
      childRoute: '404',
    ),
    '/pages/privacy-policy': RouteBreadcrumbModel(
      // title: 'Privacy & Policy',
      title: l.S.current.privacyPolicy,
      parentRoute: 'Pages',
      childRoute: 'Privacy & Policy',
    ),
    '/pages/terms-conditions': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.termsConditions,
      parentRoute: 'Pages',
      childRoute: 'Terms & Conditions',
    ),
    // master routes
    '/master/list-sectors': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.listSectors,
      parentRoute: 'Master/Sectors',
      childRoute: 'List Sectors',
    ),
    '/master/list-departments': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.listDepartments,
      parentRoute: 'Master/Departments',
      childRoute: 'List Departments',
    ),
    '/master/list-sections': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.listSections,
      parentRoute: 'Master/Sections',
      childRoute: 'List Sections',
    ),

    '/users/user-role-list': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.userRole,
      parentRoute: 'User/User Role',
      childRoute: 'List User Role',
    ),
  };
}
