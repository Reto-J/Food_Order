import 'package:flutter/material.dart';

class RestHome extends StatefulWidget {
  const RestHome({super.key});

  @override
  State<RestHome> createState() => _RestHomeState();
}

class _RestHomeState extends State<RestHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 50, 15, 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(child: Text('Image'),radius: 25),
                      SizedBox(width: 20),
                      Icon(Icons.star_border_outlined),
                    ],
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu))
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(itemCount: 13,itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(children: [
                              CircleAvatar(child: Text("Image"),radius: 25),
                              SizedBox(width: 8),
                              Text("Name"),
                              SizedBox(width: 150),
                              Icon(Icons.star_outline),
                            ],),
                            SizedBox(height: 10),
                            Text("I/flutter (24063): ---------------{token: eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2OTYwZjBkMWUxNmU5YjI1MzI1Njg0ZTYiLCJpYXQiOjE3Njg1Njk5MzksImV4cCI6MTc4NDEyMTkzOX0.XYKwwgNAJiGkwyKL-opAEiGdW8gKo60NezI4Llm2qjg, role: Usertype.user}----------------",)
                          ],
                        ),
                      )
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}