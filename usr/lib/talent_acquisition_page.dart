import 'package:flutter/material.dart';

class TalentAcquisitionPage extends StatefulWidget {
  const TalentAcquisitionPage({super.key});

  @override
  State<TalentAcquisitionPage> createState() => _TalentAcquisitionPageState();
}

class _TalentAcquisitionPageState extends State<TalentAcquisitionPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    // Use a LayoutBuilder to make it responsive for web embedding
    return Scaffold(
      appBar: AppBar(
        title: const Text('Talent Acquisition Journey'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 800),
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Stepper(
                type: StepperType.vertical,
                currentStep: _currentStep,
                onStepTapped: (step) => setState(() => _currentStep = step),
                onStepContinue: () {
                  if (_currentStep < 5) {
                    setState(() => _currentStep += 1);
                  }
                },
                onStepCancel: () {
                  if (_currentStep > 0) {
                    setState(() => _currentStep -= 1);
                  }
                },
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      children: [
                        if (_currentStep < 5)
                          FilledButton(
                            onPressed: details.onStepContinue,
                            child: const Text('Next Step'),
                          ),
                        if (_currentStep > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                            ),
                          ),
                      ],
                    ),
                  );
                },
                steps: [
                  Step(
                    title: const Text('Application Received', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 1'),
                    content: const Text(
                      'Your application has been successfully submitted. Our team will review your resume and cover letter to match your skills with the role requirements.',
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep > 0 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Resume Screening', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 2'),
                    content: const Text(
                      'Our recruiters are currently reviewing your profile. We look for relevant experience, skills, and cultural fit for the organization.',
                    ),
                    isActive: _currentStep >= 1,
                    state: _currentStep > 1 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Initial Interview', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 3'),
                    content: const Text(
                      'A brief call with our HR team to discuss your background, career goals, and interest in the position. This is also a great chance for you to ask questions.',
                    ),
                    isActive: _currentStep >= 2,
                    state: _currentStep > 2 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Technical Assessment', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 4'),
                    content: const Text(
                      'Depending on the role, you may be asked to complete a skills assessment, coding challenge, or case study to demonstrate your expertise.',
                    ),
                    isActive: _currentStep >= 3,
                    state: _currentStep > 3 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Final Interview', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 5'),
                    content: const Text(
                      'Meet with the hiring manager and key team members. We will dive deeper into your experience and discuss how you can contribute to the team.',
                    ),
                    isActive: _currentStep >= 4,
                    state: _currentStep > 4 ? StepState.complete : StepState.indexed,
                  ),
                  Step(
                    title: const Text('Job Offer', style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: const Text('Step 6'),
                    content: const Text(
                      'Congratulations! If selected, you will receive a formal offer letter detailing your compensation, benefits, and start date.',
                    ),
                    isActive: _currentStep >= 5,
                    state: _currentStep == 5 ? StepState.complete : StepState.indexed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
