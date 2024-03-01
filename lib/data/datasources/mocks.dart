import 'dart:convert';

import 'package:codelitt_calendar_ui/core/shared/api_client.dart';

final mockDeleteReminderById = MockResponse('', 200);

final mockCreateReminder = MockResponse(
    jsonEncode({
      "id": "b45d0e9f-5d15-4cd7-baf6-19df5e7a6f33",
      "title": "Standups and DS&T",
      "description":
          "Codelitt Inc. is inviting to a Zoom meeting in which everyone as people from the company will participate.",
      "date": "2024-02-12T11:15:00.000Z",
      "color": "#c8e6c9",
      "createdAt": "2024-02-12T12:49:46.257Z",
      "updatedAt": "2024-02-12T13:50:41.671Z"
    }),
    201);

final mockGetDaysWithReminders = MockResponse(
    jsonEncode([
      {"date": "2024-02-11T00:00:00.000Z"},
      {"date": "2024-02-12T00:00:00.000Z"},
      {"date": "2024-02-15T00:00:00.000Z"}
    ]),
    200);

final mockGetRemindersByDay = MockResponse(
    jsonEncode([
      {
        "id": "3977e7c8-5009-4525-840f-ace0e746226f",
        "title": "Architecture Overview",
        "description":
            "Meeting for the presentation of the new application architecture.",
        "date": "2024-02-12T12:00:00.000Z",
        "color": "#ffcc80",
        "createdAt": "2024-02-12T12:50:35.964Z",
        "updatedAt": "2024-02-12T13:50:46.414Z"
      },
      {
        "id": "4d8fbc80-7882-42bd-9865-57d20f2793ab",
        "title": "Interview",
        "description": "Interview for the DevOps position",
        "date": "2024-02-12T14:40:00.000Z",
        "color": "#ff8ed4",
        "createdAt": "2024-02-12T13:50:28.870Z",
        "updatedAt": "2024-02-12T13:50:28.870Z"
      }
    ]),
    200);
