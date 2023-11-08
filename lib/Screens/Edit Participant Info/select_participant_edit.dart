import 'package:flutter/material.dart';
import 'package:talk_of_the_town/Models/participant.dart';
import 'package:talk_of_the_town/Screens/Edit%20Participant%20Info/edit_participant_info.dart';
import 'package:talk_of_the_town/Screens/loading.dart';
import 'package:talk_of_the_town/Utilities/database_manager.dart';

class SelectParticipantEdit extends StatefulWidget {
  SelectParticipantEdit({super.key});

  @override
  State<SelectParticipantEdit> createState() => _SelectParticipantEditState();
}

class _SelectParticipantEditState extends State<SelectParticipantEdit> {
  DatabaseManager databaseManager = DatabaseManager();

  // retrieve participant info from the database.
  Future<List<Participant>> getParticipants() async {
    return await databaseManager.getAllParticipants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Edit Participant Info"),
        ),
        body: Center(
          child: FutureBuilder(
              future: getParticipants(),
              builder: (context, future) {
                if (!future.hasData) {
                  return const Loading();
                }
                List<Participant> participants = future.data!;

                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          participants[index].nickname ?? "no nickname",
                        ),
                        onTap: () async {
                          Participant? editedParticipant = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditParticipantInfo(
                                      participants[index])));
                          if (editedParticipant != null) {
                            setState(
                                () => participants[index] = editedParticipant);
                          }
                        },
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const Divider(color: Colors.grey),
                    itemCount: participants.length);
              }),
        ));
  }
}
