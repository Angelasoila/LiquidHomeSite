import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Pages
import '../pages/login/login_page.dart';
import '../pages/admin/admin_dashboard_page.dart';
import '../pages/technician/dashboard_page.dart';

class AppRouter {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    refreshListenable: GoRouterRefreshStream(_auth.authStateChanges()),
    redirect: (context, state) async {
      final user = _auth.currentUser;
      final location = state.matchedLocation;

      // Not logged in → always go to login
      if (user == null) {
        return location == '/login' ? null : '/login';
      }

      // Logged in → fetch role from Firestore
      final doc =
          await _db.collection('users').doc(user.uid).get();

      if (!doc.exists) {
        await _auth.signOut();
        return '/login';
      }

      final role = doc['role'];

      // Admin routing
      if (role == 'admin') {
        if (location.startsWith('/tech')) {
          return '/admin';
        }
        return location == '/login' ? '/admin' : null;
      }

      // 🧑 Technician routing
      if (role == 'technician') {
        if (location.startsWith('/admin')) {
          return '/tech';
        }
        return location == '/login' ? '/tech' : null;
      }

      // ❌ Unknown role → logout
      await _auth.signOut();
      return '/login';
    },
    routes: [
      GoRoute(
        path: '/login',
        pageBuilder: (context, state) =>
            const MaterialPage(child: LoginPage()),
      ),

      // Admin routes
      GoRoute(
        path: '/admin',
        pageBuilder: (context, state) =>
            const MaterialPage(child: AdminDashboardPage()),
      ),

      // Technician routes
      GoRoute(
        path: '/tech',
        pageBuilder: (context, state) =>
            const MaterialPage(child: TechnicianDashboardPage()),
      ),
    ],
  );
}

/// Helper to refresh GoRouter when auth state changes
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    stream.listen((_) => notifyListeners());
  }
}

