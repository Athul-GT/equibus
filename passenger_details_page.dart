import 'package:flutter/material.dart';

class PassengerDetailsPage extends StatefulWidget {
  final List<String> selectedSeats;

  const PassengerDetailsPage({
    super.key,
    required this.selectedSeats,
  });

  @override
  State<PassengerDetailsPage> createState() => _PassengerDetailsPageState();
}

class _PassengerDetailsPageState extends State<PassengerDetailsPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("1st Passenger Details"),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Passenger #1",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Seat No. ${widget.selectedSeats.first}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // NAME FIELD
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Enter Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // AGE FIELD
            TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter Age",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // GENDER SELECT
            InkWell(
              onTap: () async {
                final result = await showModalBottomSheet<String>(
                  context: context,
                  builder: (_) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        title: const Text("Male"),
                        onTap: () => Navigator.pop(context, "Male"),
                      ),
                      ListTile(
                        title: const Text("Female"),
                        onTap: () => Navigator.pop(context, "Female"),
                      ),
                      ListTile(
                        title: const Text("Other"),
                        onTap: () => Navigator.pop(context, "Other"),
                      ),
                    ],
                  ),
                );

                if (result != null) {
                  setState(() => gender = result);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Text(
                      gender ?? "Gender Type",
                      style: TextStyle(
                        color: gender == null
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // BUTTON
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  // later → navigate to contact details
                },
                child: const Text(
                  "PROVIDE CONTACT DETAILS",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
