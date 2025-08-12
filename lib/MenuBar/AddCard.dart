import 'package:digitalmenu/Common/Color.dart';
import 'package:digitalmenu/Common/Components.dart';
import 'package:flutter/material.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({super.key});

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  TextEditingController txtCardNumber = TextEditingController();
  TextEditingController txtCardMonth = TextEditingController();
  TextEditingController txtCardYear = TextEditingController();
  TextEditingController txtCardCode = TextEditingController();
  TextEditingController txtFirstName = TextEditingController();
  TextEditingController txtLastName = TextEditingController();
  bool isAnyTime = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(  
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 25),
          width: media.width,
          decoration: BoxDecoration(
              color: bg,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,  
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Add Credit/Debit Card",
                    style: TextStyle(
                        color: primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: primaryText,
                      size: 25,
                    ),
                  )
                ],
              ),
              Divider(
                color: secondaryText.withOpacity(0.4),
                height: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                hintText: "Card Number",
                controller: txtCardNumber,
                keyboardType: TextInputType.number,
                bgColor: placeholder.withOpacity(0.2),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    "Expiry",
                    style: TextStyle(
                        color: primaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 100,
                    child: RoundTextfield(
                      hintText: "MM",
                      controller: txtCardMonth,
                      keyboardType: TextInputType.number,
                      bgColor: placeholder.withOpacity(0.2),
                    ),
                  ),
                  const SizedBox(width: 25),
                  SizedBox(
                    width: 100,
                    child: RoundTextfield(
                      hintText: "YYYY",
                      controller: txtCardYear,
                      keyboardType: TextInputType.number,
                      bgColor: placeholder.withOpacity(0.2),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                hintText: "Card Security Code",
                controller: txtCardCode,
                keyboardType: TextInputType.number,
                bgColor: placeholder.withOpacity(0.2),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                hintText: "First Name",
                controller: txtFirstName,
                bgColor: placeholder.withOpacity(0.2),
              ),
              const SizedBox(
                height: 15,
              ),
              RoundTextfield(
                hintText: "Last Name",
                controller: txtLastName,
                bgColor: placeholder.withOpacity(0.2),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(children: [
                Text(
                  "You can remove this card at anytime",
                  style: TextStyle(
                      color: secondaryText,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                Switch(
                    value: isAnyTime,
                    activeColor: primary,
                    onChanged: (newVal) {
                      setState(() {
                        isAnyTime = newVal;
                      });
                    })
              ]),
              const SizedBox(
                height: 25,
              ),
              RoundIconButton(
                  title: "Add Card",
                  icon: "assets/img/add.png",
                  color: primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  onPressed: () {Navigator.pop(context);},),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
