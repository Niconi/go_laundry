import 'package:flutter/material.dart';
import 'package:go_laundry/models/service_option.dart';
import 'package:go_laundry/themes.dart';

class ServiceTypeBox extends StatefulWidget {
  final String serviceName;

  ServiceTypeBox({
    super.key,
    required this.serviceName,
  });

  @override
  _ServiceTypeBoxState createState() => _ServiceTypeBoxState();
}

class _ServiceTypeBoxState extends State<ServiceTypeBox> {
  late ServiceOption _serviceOption;
  late Map<String, bool> _selectedOptions;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _kgController =
      TextEditingController(text: '1.0');
  final FocusNode _kgFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _serviceOption = serviceOptions.firstWhere(
      (option) => option.serviceName == widget.serviceName,
      orElse: () => ServiceOption(serviceName: widget.serviceName, options: []),
    );

    _selectedOptions = {
      for (var option in _serviceOption.options) option: false
    };
  }

  void _incrementWeight() {
    double currentValue = double.tryParse(_kgController.text) ?? 1;
    setState(() {
      currentValue += 1;
      _kgController.text = currentValue.toStringAsFixed(1);
    });
  }

  void _decrementWeight() {
    double currentValue = double.tryParse(_kgController.text) ?? 1;
    if (currentValue > 1) {
      setState(() {
        currentValue -= 1;
        _kgController.text = currentValue.toStringAsFixed(1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 16),
          padding: const EdgeInsets.only(top: 16, bottom: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Jenis ${_serviceOption.serviceName} • Pilih 1 atau lebih',
                  style: boldText14,
                ),
              ),
              const SizedBox(height: 10),
              const Divider(color: Colors.grey, thickness: 0.5, height: 1),
              SizedBox(
                height: 200,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: ListView.separated(
                    controller: _scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: _serviceOption.options.length,
                    itemBuilder: (context, index) {
                      final option = _serviceOption.options[index];
                      return ListTile(
                        dense: true,
                        contentPadding: const EdgeInsets.only(
                          left: 20,
                          right: 10,
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(option, style: regularText14),
                            Checkbox(
                              visualDensity: VisualDensity.compact,
                              value: _selectedOptions[option],
                              checkColor: whiteColor,
                              activeColor: limeGreenColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  _selectedOptions[option] = value ?? false;
                                });
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            _selectedOptions[option] =
                                !_selectedOptions[option]!;
                          });
                        },
                      );
                    },
                    separatorBuilder: (context, index) => const Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      height: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Estimasi Total Kg:',
                  style: regularText14.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _decrementWeight,
                      icon: Icon(Icons.remove),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _kgController,
                        focusNode: _kgFocusNode,
                        decoration: InputDecoration(
                          hintText: 'Masukkan estimasi berat (kg)',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                                color: Colors.grey, width: 0.5),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                        ),
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true),
                      ),
                    ),
                    IconButton(
                      onPressed: _incrementWeight,
                      icon: Icon(Icons.add),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
