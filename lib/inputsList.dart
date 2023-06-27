import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:stardust/stardust.dart';

class InputsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(Spacing.xxxs.value),
      children: [
        Select<String>(
          decoration: InputDecoration(
              labelText: 'Select',
              hintText: 'chose one',
              prefixIcon: Icon(Icons.zap)),
          options: [
            SelectOption('11111', false),
            SelectOption('aaaaaa', false),
            SelectOption('abcdefg', true),
            SelectOption('1234567', false),
          ],
          builderOptionItem: (value, checked) => Text(value),
          onChange: (value) {},
          title: Text('Select one'),
        ),
        SizedBox(height: Spacing.nano.value),
        Select<String>(
          multiples: true,
          decoration: InputDecoration(
              labelText: 'Select',
              hintText: 'chose one',
              prefixIcon: Icon(Icons.zap)),
          options: [
            SelectOption('11111', false),
            SelectOption('xyz', false),
            SelectOption('aaaaaa', false),
            SelectOption('abcdefg', false),
            SelectOption('1234567', false),
          ],
          builderOptionItem: (value, checked) => Text(value),
          onChange: (value) {},
          title: Text('Select one'),
        ),
        SizedBox(height: Spacing.nano.value),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'TextFormField',
            hintText: 'Hint text',
            prefixIcon: Icon(Icons.align_right_011),
          ),
        ),
        SizedBox(height: Spacing.nano.value),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Placeholder',
            prefixIcon: Icon(Icons.zap1),
          ),
        ),
        SizedBox(height: Spacing.nano.value),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'TextFormField',
            suffixIcon: Icon(
              Icons.annotation_plus1,
            ),
            prefixIcon: Icon(Icons.clock),
          ),
        ),
        SizedBox(height: Spacing.nano.value),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'TextFormField',
            suffixIcon: Icon(Icons.mouse),
            prefixIcon: Icon(Icons.modem_01),
            helperText: 'Helper text',
          ),
        ),
        SizedBox(height: Spacing.nano.value),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Number',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Money'),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CurrencyInputFormatter(NumberFormat.simpleCurrency(
              name: 'BRL',
              locale: 'pt_BR',
            ))
          ],
        ),
      ],
    );
  }
}
