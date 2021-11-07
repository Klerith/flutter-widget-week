import 'package:flutter/material.dart';
import 'package:widget_week/data/people.dart';


class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> contacts = [ ...people ];


  void onTogglePinned( int index ) {

    setState(() {
      contacts[index]['pinned'] = !contacts[index]['pinned'];
    });
  }

  void onDeleteContact( int index ) {

    setState(() {
      contacts.removeAt(index);
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget de la semana'),
        elevation: 0,
      ),
      body: ListView.separated(
        itemCount: contacts.length,
        separatorBuilder: ( _ , __ ) => Divider( color: Colors.black26, height: 2 ),
        itemBuilder: ( _ , int index ) => ListItem( 
            index: index, 
            contact: contacts[index], 
            onDeleteContact: onDeleteContact, 
            onTogglePinned: onTogglePinned,
        ),
      )
   );
  }
}

class ListItem extends StatelessWidget {
  
  final Map<String, dynamic> contact;
  final int index;
  final Function onTogglePinned;
  final Function onDeleteContact;

  const ListItem({
    required this.contact, 
    required this.index,
    required this.onTogglePinned,
    required this.onDeleteContact,
  });


  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: UniqueKey(),

      background: Container(
        color: Colors.red[400],
        child: Icon(  Icons.delete_outline_rounded, color: Colors.white ),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only( left: 10 )
      ),

      secondaryBackground: Container(
        color: Colors.blue,
        child: Icon(  Icons.push_pin_outlined, color: Colors.white ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only( right: 10 )
      ),

      onDismissed: ( direction ) {
        if ( direction == DismissDirection.startToEnd ) {
          print( 'Elimiar este elemento $index');
          onDeleteContact( index );
        }
      },

      confirmDismiss: ( direction ) async {

        // Pinned o Toggle
        if ( direction == DismissDirection.endToStart ) {
          onTogglePinned( index );
          return false;
        }


        return true;
      },

      child: ListTile(
        leading: Icon( contact['pinned'] ? Icons.push_pin_outlined : Icons.circle_outlined ),
        title: Text('${ contact['first_name'] } ${ contact['last_name'] }'),
        subtitle: Text( contact['phone'] ),
        dense: true,
      ),
    );

  }
}