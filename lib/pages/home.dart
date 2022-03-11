import 'package:flutter/material.dart';
import 'package:lab4/services/agify_service.dart';

class Home extends StatefulWidget {

  final AgifyService _agifyService;

  const Home({Key? key})
      : _agifyService = const AgifyService(),
        super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final _formKey = GlobalKey<FormState>();
  String? _name;
  int? _age;

  void OnSubmit() async{
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();

      final calculatedAge = await widget._agifyService.getAge(_name!);

      setState(() {
        _age = calculatedAge;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                    helperText: 'Name'

                  ),
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'Please Enter the Name';
                    }
                    return null;
                  },
                  onSaved: (String? value){
                    setState(() {
                      if(value != null) _name = value;
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: OnSubmit,
                  child: const Text('Get Age'),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        if(_age != null)
          Center(
            child: Text(
              "Age is $_age",
              style: Theme.of(context).textTheme.headline4,
            ),
          )
      ],
    );
  }
}
