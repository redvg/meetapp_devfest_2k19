import 'package:flutter/material.dart';
import 'package:meetapp_devfest19/components/avatar.dart';


class CalendarSuggestion extends StatefulWidget{
  final String title;
  final String details;
  final String venue;
  final Function onSave;

  const CalendarSuggestion({
    Key key,
    @required this.title,
    @required this.details,
    @required this.venue,
    @required this.onSave,
  }) : assert (title.length > 0),
       assert (details.length > 0),
       assert (venue.length > 0),
       super(key : key);

  @override
  _CalendarSuggestionState createState() => _CalendarSuggestionState();
}

class _CalendarSuggestionState extends State<CalendarSuggestion>{
  bool isSaved = false;

  Widget _buildAvatars() =>
   Row(
     children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          widthFactor: 0.6,
          child: Avatar(
            radius: 12.0,
            imagePath: 'assets/images/avatar.png',
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          widthFactor: 0.6,
          child: Avatar(
            radius: 12.0,
            imagePath: 'assets/images/avatar.png',
          ),
        ),
        Avatar(
          radius: 12.0,
          imagePath: 'assets/images/avatar.png',
        ),
     ],
   );

  void _onSaved(){
    final String message = isSaved ? 'Meetup unsaved' : 'Meetup saved';
    setState(() {
      isSaved = !isSaved;
    });
    widget.onSave(message);
  }

  @override
  Widget build(BuildContext context){
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Divider(height: 2.0,),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 13.0,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.details,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 15.0,
                letterSpacing: 0.8,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.venue,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w400,
                fontSize: 13.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildAvatars(),
                  Text('70'),
                ],
              ),
              AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: !isSaved ?
                  IconButton(
                    key: GlobalKey(),
                    icon: Icon(
                      Icons.star_border,
                    ), 
                    onPressed: ()=>_onSaved(),
                    ) :
                  IconButton(
                    key: GlobalKey(),
                    icon: Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ), 
                    onPressed: ()=>_onSaved(),
                  ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}





