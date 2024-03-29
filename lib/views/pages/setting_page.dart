part of 'pages.dart';

class SettingPage extends StatelessWidget {
  static const routeName = '/setting_page';

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: greyColor,
        title: const Text('Setting'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall,
      ),
      backgroundColor: greyColor,
      body: ListView(
        children: [
          Material(
            child: ListTile(
              title: const Text("Daily Reminder"),
              subtitle: const Text("Show notification at 11.00 am everyday"),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                      value: scheduled.isScheduled,
                      onChanged: (newValue) {
                        scheduled.scheduledRestaurant(newValue);
                      });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
