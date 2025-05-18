import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoes_shopapp/pages/summary_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final streetController = TextEditingController();
  final cityController = TextEditingController();
  

  void goToSummaryPage() {
    if (_formKey.currentState!.validate()) {
      // Navigate to the summary page and pass the data
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SummaryPage(
            fullName: nameController.text,
            phone: phoneController.text,
            street: streetController.text,
            city: cityController.text,
          ),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: const Text('Enter Delivery Address')
        ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Full Name
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Enter your name' : null,
              ),
              SizedBox(height: 10.h),

              // Phone
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) => value!.isEmpty ? 'Enter phone number' : null,
              ),
              SizedBox(height: 10.h),

              // Street Address
              TextFormField(
                controller: streetController,
                decoration: const InputDecoration(labelText: 'Street Address'),
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
              ),
              SizedBox(height: 10.h),

              // City
              TextFormField(
                controller: cityController,
                decoration: const InputDecoration(labelText: 'City'),
                validator: (value) => value!.isEmpty ? 'Enter city' : null,
              ),
              SizedBox(height: 10.h),

              // Continue Button
              ElevatedButton(
                onPressed: goToSummaryPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r))
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
