part of '_sidebar.dart';

class SidebarItemModel {
  final String name;
  final String iconPath;
  final SidebarItemType sidebarItemType;
  final List<SidebarSubmenuModel>? submenus;
  final String? navigationPath;
  final bool isPage;

  SidebarItemModel({
    required this.name,
    required this.iconPath,
    this.sidebarItemType = SidebarItemType.tile,
    this.submenus,
    this.navigationPath,
    this.isPage = false,
  }) : assert(
          sidebarItemType != SidebarItemType.submenu ||
              (submenus != null && submenus.isNotEmpty),
          'Sub menus cannot be null or empty if the item type is submenu',
        );
}

class SidebarSubmenuModel {
  final String name;
  final String? navigationPath;
  final bool isPage;

  SidebarSubmenuModel({
    required this.name,
    this.navigationPath,
    this.isPage = false,
  });
}

class GroupedMenuModel {
  final String name;
  final List<SidebarItemModel> menus;

  GroupedMenuModel({
    required this.name,
    required this.menus,
  });
}

enum SidebarItemType { tile, submenu }

List<SidebarItemModel> get _topMenus {
  return <SidebarItemModel>[
    SidebarItemModel(
      // name: 'Dashboard',
      name: l.S.current.dashboard,
      iconPath: 'assets/images/sidebar_icons/home-dash-star.svg',
      navigationPath: '/dashboard/home',
      sidebarItemType: SidebarItemType.tile,
    ),
  ];
}

List<GroupedMenuModel> get _groupedMenus {
  return <GroupedMenuModel>[
    // Application Group
    GroupedMenuModel(
      //name: 'Application',
      name: l.S.current.application,
      menus: [
        // SidebarItemModel(
        //   //name: 'Users',
        //   name: l.S.current.application,
        //   iconPath: 'assets/images/sidebar_icons/clipboard-text.svg',
        //   sidebarItemType: SidebarItemType.submenu,
        //   navigationPath: '/appsetting',
        //   submenus: [
        //     SidebarSubmenuModel(
        //       //name: "Users List",
        //       name: l.S.current.applicationlist,
        //       navigationPath: "application-list",
        //     ),
        //   ],
        // ),
        SidebarItemModel(
          //name: 'Users',
          name: l.S.current.users,
          iconPath: 'assets/images/sidebar_icons/users-group.svg',
          sidebarItemType: SidebarItemType.submenu,
          navigationPath: '/users',
          submenus: [
            SidebarSubmenuModel(
              //name: "Users List",
              name: l.S.current.usersList,
              navigationPath: "user-list",
            ),
            SidebarSubmenuModel(
              //name: "Users List",
              name: l.S.current.unauthorisedusersList,
              navigationPath: "unauthorised-users",
            ),
            SidebarSubmenuModel(
              //name: "Users Grid",
              name: l.S.current.usersGrid,
              navigationPath: "user-grid",
            ),
            SidebarSubmenuModel(
              //name: "User Profile",
              name: l.S.current.userProfile,
              navigationPath: "user-profile",
            ),
          ],
        ),
      ],
    ),
    GroupedMenuModel(
      //name: 'Application',
      name: l.S.current.master,
      menus: [
        SidebarItemModel(
          //name: 'Users',
          name: l.S.current.master,
          iconPath: 'assets/images/sidebar_icons/users-group.svg',
          sidebarItemType: SidebarItemType.submenu,
          navigationPath: '/master',
          submenus: [
            SidebarSubmenuModel(
              //name: "Users List",
              name: l.S.current.sector,
              navigationPath: "list-sectors",
            ),
            SidebarSubmenuModel(
              //name: "Users Grid",
              name: l.S.current.department,
              navigationPath: "list-departments",
            ),
            SidebarSubmenuModel(
              //name: "User Profile",
              name: l.S.current.section,
              navigationPath: "list-sections",
            ),
          ],
        ),
      ],
    ),

    // Pages
    /* GroupedMenuModel(
      //name: 'Pages',
      name: l.S.current.pages,
      menus: [
        SidebarItemModel(
          // name: 'Authentication',
          name: l.S.current.authentication,
          iconPath: 'assets/images/sidebar_icons/note-list.svg',
          sidebarItemType: SidebarItemType.submenu,
          navigationPath: '/authentication',
          submenus: [
            SidebarSubmenuModel(
              //name: "Sign Up",
              name: l.S.current.signUp,
              navigationPath: 'signup',
              isPage: true,
            ),
            SidebarSubmenuModel(
              //name: "Sign In",
              name: l.S.current.signIn,
              navigationPath: 'signin',
              isPage: true,
            ),
          ],
        ),
        /* SidebarItemModel(
          // name: 'Gallery',
          name: l.S.current.gallery,
          iconPath: 'assets/images/sidebar_icons/image-gallery.svg',
          navigationPath: '/pages/gallery',
        ),
        SidebarItemModel(
          // name: '404',
          name: l.S.current.error,
          iconPath: 'assets/images/sidebar_icons/diamond-exclamation.svg',
          navigationPath: '/pages/404',
          isPage: true,
        ), */
      ],
    ), */
  ];
}
