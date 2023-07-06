
import 'package:dummy/providers/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TicketWidget extends StatelessWidget {
  const TicketWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
         gradient: LinearGradient(
          begin: Alignment.bottomLeft,end: Alignment.topRight,
          colors: [Color(0xFF62535d),  Color(0xFF5d5153)]
          ),
        shape: BoxShape.rectangle,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
        child: Column(
          children: [
            Text(
              'Select Tickets',
               style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold
               ),
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                   onTap: () => context.read<EventProvider>().decrementTicket(),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration:  const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF887c81),  Color(0xFF7f7378)]
                        ),
                      shape: BoxShape.circle,
                     
                    ),
                    child: const Icon(CupertinoIcons.minus, color: Colors.white, size: 30,),
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF7e7275),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF887d81),  Color(0xFF7c7174)]
                        ),
                  ),
                  child: Center(
                    child: Text(
                          '${context.watch<EventProvider>().selectedTickets}',
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                             color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold
                          ),
                        ),
                  ),
                ),
               GestureDetector(
                   onTap: () => context.read<EventProvider>().incrementTicket(),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                       gradient: LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFFe79f3e),  Color(0xFFe06e46)]
                        ),
                    ),
                    child: const Icon(CupertinoIcons.add, color: Colors.white, size: 30,),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}