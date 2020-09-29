import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneBook extends StatefulWidget {
  final String tag;

  const PhoneBook({Key key, this.tag}) : super(key: key);

  @override
  _PhoneBookState createState() => _PhoneBookState();
}

class _PhoneBookState extends State<PhoneBook> {
  List<Contact> contacts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: widget.tag,
          flightShuttleBuilder:
              (flightContext, animation, direction, fromContext, toContext) =>
                  SizedBox.shrink(),
          child: Text(
            "Phone Book",
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 22,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<Iterable<Contact>>(
          future: ContactsService.getContacts(),
          builder: (context, snap) {
            switch (snap.connectionState) {
              case ConnectionState.none:
              case ConnectionState.active:
              case ConnectionState.waiting:
                return _getText("Awaiting Contacts ...");
              case ConnectionState.done:
                if (snap.hasError) {
                  return _getText("Error : ${snap.error.toString()}");
                }
                contacts = snap.data.toList();
                return RefreshIndicator(
                    onRefresh: () async {
                      return contacts =
                          await ContactsService.getContacts(); // EDITED
                    },
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (context, i) => ContactItem(contacts[i])));
                break;

              default:
                return SizedBox.shrink();
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Theme.of(context).primaryColor,
        icon: Icon(Icons.add),
        label: Text(
          "New Contact",
        ),
      ),
    );
  }

  Widget _getText(String val) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      alignment: Alignment.topCenter,
      child: Text(
        val,
        textAlign: TextAlign.center,
      ),
    );
  }
}

class ContactItem extends StatefulWidget {
  final Contact contact;

  ContactItem(this.contact);

  @override
  _ContactItemState createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  String title, address;
  List<String> addresses = [];
  bool showItem = true;

  @override
  void initState() {
    super.initState();
    if (widget.contact != null) {
      title = (widget.contact.displayName != null)
          ? widget.contact.displayName
          : widget.contact.phones.first;
    }
  }

  getSubTitle(List<String> addresses) {
    String s = addresses[0];
    if (showItem && addresses.length > 1) {
      for (int i = 1; i < addresses.length; i++) {
        if (addresses[i] != null) {
          s = s + ' ' + addresses[i];
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child:
            (widget.contact.avatar != null && widget.contact.avatar.length > 0)
                ? ClipOval(child: Image.memory(widget.contact.avatar))
                : Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
      ),
      title: Text(title != null ? title : ''),
      // subtitle: Text((subTitle != null) ? subTitle : '14729822'),
      onTap: () {},
    );
  }
}
