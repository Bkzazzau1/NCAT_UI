import 'package:flutter/material.dart';

import '../app/theme.dart';
import '../models/demo_models.dart';

const demoStudent = StudentProfile(
  name: 'Aisha Mohammed Bala',
  regNo: 'NCAT/2026/PILOT/018',
  programme: 'Standard Pilot Course',
  level: 'Flight Training Phase II',
  fileCompletion: .78,
  riskScore: 62,
  flightHours: 42.5,
  simulatorHours: 8.0,
  attendance: .84,
  clearanceStatus: 'Pending Bursary + Hostel',
);

final executiveMetrics = <MetricItem>[
  const MetricItem(
    title: 'Active Students',
    value: '1,247',
    subtitle: '+84 admitted this term',
    icon: Icons.school_rounded,
    accent: NCATTheme.cyan,
  ),
  const MetricItem(
    title: 'Incomplete Files',
    value: '184',
    subtitle: 'AI found 43 urgent cases',
    icon: Icons.folder_off_rounded,
    accent: NCATTheme.gold,
  ),
  const MetricItem(
    title: 'Training Risks',
    value: '27',
    subtitle: 'Attendance/logbook issues',
    icon: Icons.warning_amber_rounded,
    accent: NCATTheme.red,
  ),
  const MetricItem(
    title: 'Infrastructure Alerts',
    value: '18',
    subtitle: '3 critical assets need action',
    icon: Icons.hub_rounded,
    accent: NCATTheme.purple,
  ),
];

final aiAlerts = <AlertItem>[
  const AlertItem(
    title: 'Missing file cluster detected',
    message:
        '43 student records are missing medical clearance or final bursary confirmation.',
    severity: 'High',
    owner: 'Registry + Bursary',
  ),
  const AlertItem(
    title: 'Flight training gap',
    message:
        '12 pilot students have more than 14 days gap since last aircraft session.',
    severity: 'Medium',
    owner: 'Training Office',
  ),
  const AlertItem(
    title: 'Simulator maintenance due',
    message:
        'Simulator B has 6 hours left before recommended maintenance inspection.',
    severity: 'High',
    owner: 'Engineering Unit',
  ),
  const AlertItem(
    title: 'Approval delay',
    message:
        'Aircraft Maintenance result approval has stayed with department for 6 days.',
    severity: 'Medium',
    owner: 'HoD Office',
  ),
];

final missingFiles = <MissingFileItem>[
  const MissingFileItem(
    owner: 'NCAT/2026/PILOT/018',
    category: 'Student File',
    missing: 'Medical clearance, hostel approval',
    department: 'Medical + Hostel',
    daysPending: 9,
    priority: 'High',
  ),
  const MissingFileItem(
    owner: 'NCAT/2026/AME/044',
    category: 'Training File',
    missing: 'Workshop practical logbook Week 4',
    department: 'Training Office',
    daysPending: 5,
    priority: 'Medium',
  ),
  const MissingFileItem(
    owner: 'Procurement/ICT/2026/019',
    category: 'Admin File',
    missing: 'Vendor evaluation memo',
    department: 'Procurement',
    daysPending: 11,
    priority: 'High',
  ),
  const MissingFileItem(
    owner: 'Safety/Hangar-2/2026',
    category: 'Compliance File',
    missing: 'Fire extinguisher inspection report',
    department: 'Safety Unit',
    daysPending: 14,
    priority: 'Critical',
  ),
];

final flightHistory = <FlightRecord>[
  const FlightRecord(
    date: '06 Jun 2026',
    aircraft: '5N-NCT',
    type: 'Dual Flight',
    duration: 1.4,
    instructor: 'Capt. Yusuf Danladi',
    remark: 'Landing approach improved. Continue flare control practice.',
  ),
  const FlightRecord(
    date: '02 Jun 2026',
    aircraft: 'SIM-B737',
    type: 'Simulator',
    duration: 2.0,
    instructor: 'Capt. A. Musa',
    remark: 'Emergency landing procedure completed with minor correction.',
  ),
  const FlightRecord(
    date: '22 May 2026',
    aircraft: '5N-NCA',
    type: 'Solo Supervised',
    duration: .8,
    instructor: 'Capt. Yusuf Danladi',
    remark: 'Good circuit control. Needs stronger radio discipline.',
  ),
  const FlightRecord(
    date: '12 May 2026',
    aircraft: '5N-NCT',
    type: 'Dual Flight',
    duration: 1.1,
    instructor: 'Capt. S. Ahmed',
    remark: 'Crosswind takeoff introduced. Performance acceptable.',
  ),
];

final infrastructureAssets = <AssetItem>[
  const AssetItem(
    name: 'Flight Simulator B',
    location: 'Simulator Centre',
    category: 'Training Equipment',
    status: 'Maintenance Due Soon',
    health: .63,
    nextAction: 'Inspection in 6 operating hours',
  ),
  const AssetItem(
    name: 'Generator 2',
    location: 'Power House',
    category: 'Power Infrastructure',
    status: 'Repeated Downtime',
    health: .48,
    nextAction: 'Preventive maintenance recommended',
  ),
  const AssetItem(
    name: 'Hostel Block C',
    location: 'Student Residence',
    category: 'Facility',
    status: 'Open Complaints',
    health: .70,
    nextAction: 'Resolve water issue complaints',
  ),
  const AssetItem(
    name: 'Hangar 2 Safety Kit',
    location: 'Hangar 2',
    category: 'Safety Compliance',
    status: 'Inspection Overdue',
    health: .42,
    nextAction: 'Fire extinguisher check required',
  ),
];

final aiPrompts = <String>[
  'Which students have missing files?',
  'Generate report for the Rector.',
  'Show flight training risks.',
  'List infrastructure assets due for maintenance.',
  'Find delayed approvals.',
  'Which students are ready for clearance?',
];
