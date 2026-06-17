import 'package:flutter/material.dart';

class NavItem {
  const NavItem({required this.title, required this.icon});
  final String title;
  final IconData icon;
}

class MetricItem {
  const MetricItem({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.accent,
  });

  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color accent;
}

class AlertItem {
  const AlertItem({
    required this.title,
    required this.message,
    required this.severity,
    required this.owner,
  });

  final String title;
  final String message;
  final String severity;
  final String owner;
}

class StudentProfile {
  const StudentProfile({
    required this.name,
    required this.regNo,
    required this.programme,
    required this.level,
    required this.fileCompletion,
    required this.riskScore,
    required this.flightHours,
    required this.simulatorHours,
    required this.attendance,
    required this.clearanceStatus,
  });

  final String name;
  final String regNo;
  final String programme;
  final String level;
  final double fileCompletion;
  final int riskScore;
  final double flightHours;
  final double simulatorHours;
  final double attendance;
  final String clearanceStatus;
}

class MissingFileItem {
  const MissingFileItem({
    required this.owner,
    required this.category,
    required this.missing,
    required this.department,
    required this.daysPending,
    required this.priority,
  });

  final String owner;
  final String category;
  final String missing;
  final String department;
  final int daysPending;
  final String priority;
}

class FlightRecord {
  const FlightRecord({
    required this.date,
    required this.aircraft,
    required this.type,
    required this.duration,
    required this.instructor,
    required this.remark,
  });

  final String date;
  final String aircraft;
  final String type;
  final double duration;
  final String instructor;
  final String remark;
}

class AssetItem {
  const AssetItem({
    required this.name,
    required this.location,
    required this.category,
    required this.status,
    required this.health,
    required this.nextAction,
  });

  final String name;
  final String location;
  final String category;
  final String status;
  final double health;
  final String nextAction;
}
