
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dummy/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';



class TicketView extends StatefulWidget {
  const TicketView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<TicketView> {
 

  @override
  Widget build(BuildContext context) {
    context.read<EventProvider>().getEvents();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
           gradient: LinearGradient(
            begin: Alignment.bottomLeft,end: Alignment.topRight,
            colors: [Color(0xFF251B28),  Color(0xFF36282B)]
            )),
          child:context.read<EventProvider>().isLoading ? const Center(child: CircularProgressIndicator()) :
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
              CarouselSlider(
                items: [
                     ...List.generate(context.read<EventProvider>().eventList.data.length, (i){
                       return Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(context.read<EventProvider>().eventList.data[i].image, fit: BoxFit.cover, width: 1000.0),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration:  BoxDecoration(
                                    color:const Color(0xFF62535d).withOpacity(0.4),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.read<EventProvider>().eventList.data[i].title,overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      CircleAvatar(
                                        radius: 15,
                                        backgroundColor:const Color(0xFF62535d).withOpacity(0.5),
                                        child: const Icon(Icons.edit, color: Colors.white,size: 12,),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  })
                ],
               carouselController: context.read<EventProvider>().controller,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {
                      context.read<EventProvider>().updateIndex(index);
                    
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  ...List.generate(context.read<EventProvider>().eventList.data.length, (index){
                    return GestureDetector(
                      onTap:(){
                        context.read<EventProvider>().controller.animateToPage(index);
                      },
                      child: Container(
                      width: context.watch<EventProvider>().currentIndex == index ? 30: 10.0,
                      height: context.watch<EventProvider>().currentIndex == index ? 10: 10.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        gradient: context.watch<EventProvider>().currentIndex == index ? 
                        const LinearGradient(
                            begin: Alignment.bottomLeft,end: Alignment.topRight,
                            colors: [Color(0xFFe79f3e),  Color(0xFFe06e46)]
                            ) : null,
                          borderRadius: BorderRadius.circular(5),
                          color:  Colors.white
                        ),
                    ),
                  );
                  })
                ]
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 60,
                      decoration:  BoxDecoration(
                       gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF5B525C), Color(0xFF625859),  Color(0xFF574F50)]
                        ),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color:  Colors.white.withOpacity(0.1), width: 2)
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  [
                            const Icon(Icons.qr_code, color: Colors.white,),
                            const SizedBox(width: 20,),
                             Text("Scan Tickets", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold
                           ))
                          ],
                        ),
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                            Text("Standard tickets", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,  fontWeight: FontWeight.bold
                          )),
                          const SizedBox(width: 20,),
                            GradientText("\$${context.read<EventProvider>().eventList.data[context.watch<EventProvider>().currentIndex].standardTicket}",
                               colors: const [Color(0xFFe79f3e),  Color.fromARGB(255, 238, 85, 29)],
                             style: Theme.of(context).textTheme.titleMedium?.copyWith(
                             fontWeight: FontWeight.bold, 
                          ))
                        ],
                      ),
                    ),
                     Container(
                      height: 55,
                      decoration:  BoxDecoration(
                        gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF5B525C), Color(0xFF625859),  Color(0xFF574F50)]
                        ),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: const Color(0xFF62535d).withOpacity(0.1), width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("87/500", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600
                             )),
                             Container(
                              height: 55, width: 1, color: Colors.white.withOpacity(0.3),
                             ),
                             Text("\$300", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600
                           ))
                          ],
                        ),
                      ),
                    ),
                    
                    Padding(
                       padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                            Text("VIP tickets", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,  fontWeight: FontWeight.bold
                          )),
                          const SizedBox(width: 20,),
                            GradientText("\$${context.read<EventProvider>().eventList.data[context.watch<EventProvider>().currentIndex].vipTickets}", 
                             colors: const [Color(0xFFe79f3e),  Color.fromARGB(255, 238, 85, 29)],
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold, 
                          ))
                        ],
                      ),
                    ),
                     Container(
                      height: 55,
                      decoration:  BoxDecoration(
                         gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF5B525C), Color(0xFF625859),  Color(0xFF574F50)]
                        ),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: const Color(0xFF62535d).withOpacity(0.1), width: 2)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            Text("87/500", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                             color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600
                              )),
                             Container(
                              height: 55, width: 1, color: Colors.white.withOpacity(0.3),
                             ),
                             Text("\$300", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600

                           ))
                          ],
                        ),
                      ),
                    ),
      
                     Padding(
                       padding: const EdgeInsets.only(top: 20, bottom: 10),
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                            Text("Total Sales", style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Colors.white,  fontWeight: FontWeight.bold
                          )),
                          const SizedBox(width: 20,),
                            GradientText("\$${context.read<EventProvider>().eventList.data[context.watch<EventProvider>().currentIndex].totalSales}", 
                             colors: const [Color(0xFFe79f3e),  Color.fromARGB(255, 238, 85, 29)],
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold, 
                          ))
                        ],
                                       ),
                     ),
                  
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Payment Method',
                           style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold
                          ),
                          ),
                      ),
                    ),
            
                      Container(
                        height: 50,
                        decoration:  BoxDecoration(
                        gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,end: Alignment.topRight,
                        colors: [Color(0xFF5B525C), Color(0xFF625859),  Color(0xFF574F50)]
                        ),
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: const Color(0xFF62535d).withOpacity(0.1), width: 2)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:  [
                              Text("Stripe", style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: Colors.blue,  fontWeight: FontWeight.bold
                              )
                              ),
                              const SizedBox(width: 20,),
                              Text("Connected", style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
                              )),
                              const Spacer(),
                              GestureDetector(
                                onTap:(){},
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      begin: Alignment.bottomLeft,end: Alignment.topRight,
                                      colors: [Color(0xFFe79f3e),  Color(0xFFe06e46)]
                                      ),
                                  ),
                                  child: const Icon(Icons.check, color: Colors.white,size: 15,),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap:(){},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("Change",style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,  fontWeight: FontWeight.bold
                          )),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ]
          ),
          ),
        ),
      ),
    );
  }
}
