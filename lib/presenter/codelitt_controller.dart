import 'package:codelitt_calendar_ui/domain/entites/reminder_entity.dart';
import 'package:codelitt_calendar_ui/domain/usecases/delete_reminder_by_id.dart';
import 'package:codelitt_calendar_ui/domain/usecases/get_days_with_reminders.dart';
import 'package:codelitt_calendar_ui/domain/usecases/get_reminders_by_day.dart';
import 'package:codelitt_calendar_ui/domain/usecases/save_new_reminder.dart';
import 'package:codelitt_calendar_ui/presenter/codelitt_inherited_widget.dart';
import 'package:flutter/material.dart';

enum ViewState { loading, form, list, emptyState }

class CodelittController extends StatefulWidget {
  const CodelittController(
      {Key? key,
      required this.child,
      required this.getDaysWithReminders,
      required this.saveNewReminder,
      required this.deleteReminderById,
      required this.getRemindersByDay})
      : super(key: key);

  final IGetDaysWithReminders getDaysWithReminders;
  final IGerRemindersByDay getRemindersByDay;
  final IDeleteReminderById deleteReminderById;
  final ISaveNewReminder saveNewReminder;

  final Widget child;

  @override
  State<StatefulWidget> createState() => CodelittControllerState();
}

class CodelittControllerState extends State<CodelittController> {
  bool deleteLoading = false, saveLoading = false;
  Map<String, String> _errors = <String, String>{};
  List<ReminderEntity> _reminders = [];
  List<DateTime> _daysWithReminders = [];
  ViewState _viewState = ViewState.loading;
  ReminderEntity _currentReminder = ReminderEntity();
  DateTime _selectedDate = DateTime.now();

  ViewState get viewState => _viewState;
  ReminderEntity get currentReminder => _currentReminder;
  List<ReminderEntity> get reminders {
    return _reminders.where((reminder) {
      return reminder.dateTime ==
          DateTime(_selectedDate.year, _selectedDate.month, _selectedDate.day);
    }).toList();
  }

  List<DateTime> get daysWithReminders => _daysWithReminders;
  DateTime get selectedDate => _selectedDate;
  Map<String, String> get errors => _errors;

  @override
  void initState() {
    super.initState();
    loadRemindersByDay(_selectedDate);
    loadDaysWithReminders(_selectedDate.year, _selectedDate.month);
  }

  void setSelectedDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }

  void setViewState(ViewState viewState) {
    setState(() {
      _viewState = viewState;
    });
  }

  void setSaveLoading(bool loading) {
    setState(() {
      saveLoading = loading;
    });
  }

  void setDeleteLoading(bool loading) {
    setState(() {
      deleteLoading = loading;
    });
  }

  void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void createNew() {
    setState(() {
      _errors.clear();
      _currentReminder = ReminderEntity();
      _viewState = ViewState.form;
    });
  }

  void openReminder(ReminderEntity reminder) {
    _errors.clear();
    _currentReminder = reminder;
    setViewState(ViewState.form);
  }

  void cancel() {
    setViewState(_viewState =
        _reminders.isEmpty ? ViewState.emptyState : ViewState.list);
  }

  void addReminder(ReminderEntity reminder) {
    final index = _reminders.indexWhere((element) => element.id == reminder.id);
    if (index != -1) {
      _reminders[index] = reminder;
    } else {
      _reminders.add(reminder);
    }
    setViewState(ViewState.list);
  }

  void save() {
    if (currentReminder.isValid) {
      errors.clear();
      setSaveLoading(true);
      widget.saveNewReminder(currentReminder).then((reminder) {
        setSaveLoading(false);
        addReminder(reminder);
        loadDaysWithReminders(_selectedDate.year, _selectedDate.month);
      }).catchError((error) {
        setSaveLoading(false);
        showSnackBar(context, error.message);
      });
    } else {
      setState(() {
        _errors = currentReminder.errors();
      });
    }
  }

  void delete() {
    setDeleteLoading(true);
    widget.deleteReminderById(currentReminder.id!).then((value) {
      _reminders.remove(currentReminder);
      setDeleteLoading(false);
      setViewState(_reminders.isEmpty ? ViewState.emptyState : ViewState.list);
      loadDaysWithReminders(_selectedDate.year, _selectedDate.month);
    }).catchError((error) {
      setDeleteLoading(false);
      showSnackBar(context, error.message);
    });
  }

  void loadRemindersByDay(DateTime day) {
    setSelectedDate(day);
    setViewState(ViewState.loading);
    widget.getRemindersByDay(day).then((reminders) {
      _reminders = reminders;
      setViewState(_reminders.isEmpty ? ViewState.emptyState : ViewState.list);
    }).catchError((error) {
      setViewState(ViewState.emptyState);
      showSnackBar(context, error.message);
    });
  }

  void loadDaysWithReminders(int year, int month) {
    widget.getDaysWithReminders(year, month).then((days) {
      setState(() {
        _daysWithReminders = days;
      });
    }).catchError((error) {
      showSnackBar(context, error.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CodelittInheritedWidget(state: this, child: widget.child);
  }
}
