import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'Product.dart';

class Cproduct extends StatefulWidget {
  const Cproduct({super.key});

  @override
  State<Cproduct> createState() => _CproductState();
}

class _CproductState extends State<Cproduct> {
  var  List={
           0: Product("Sumsung TV 32", 1199.99, 0),
           1: Product("Sumsung TV 42", 4699.99, 0),
           2: Product("Sumsung TV 52", 10299.99, 0),
                  };
    double S=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Container(
                //ListView.builder pour afficher tous les element
                child: ListView.builder(
                   scrollDirection: Axis.vertical,
                  
                  itemCount: List.length,
                  itemBuilder: (context,int i){
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      color: Colors.blue[100],
                      //l'affichage de ieme element avec ListTile
                      child: ListTile(
                        leading: Icon(
                          size:30,
                          Icons.tv_sharp,
                        ),
                        title: Text("${List[i]!.getNom()}",style: TextStyle(fontSize: 20),),
                        trailing: Text("${List[i]!.getPrix()} DH",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        subtitle: Container(
                          child: Row(children: [
                             //Icone pour suprimer une unité dans la quantité
                             IconButton(onPressed:() {
                              setState(() {
                                var t=0;
                                 t=List[i]!.getQuantite();
                              t--;
                              if(t>=0){
                              List[i]!.setQuantite(t);}
                              });
                            }, icon: Icon(Icons.remove)),
                            // Le texte representant la quantité
                            Text("${List[i]!.getQuantite()}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            //Icone pour ajouter une unité dans la quantité
                            IconButton(
                              onPressed:() {
                              setState(() {
                                var t=0;
                                t=List[i]!.getQuantite();
                              t++;
                              List[i]!.setQuantite(t);
                              });
                            }, icon: Icon(Icons.add))
                          ],),
                        ),
                      ),
                    );
                  }),
              ),
            ),
            Expanded(
              flex: 0,
              child: MaterialButton(
                onPressed: (){
                       setState(() {
                 S=0;
              for (int i = 0; i < List.length; i++) {
                S=S+List[i]!.calculerPrixTotal();
                print(List[i]!.calculerPrixTotal());
              }
                       });
              },

              color:Colors.blue[300],
              child: Text("Calculer",style: TextStyle(fontSize: 35,color: Colors.white),),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Center(
                  //Affichage du résultat
                  child: Text("$S DH",style: TextStyle(fontSize: 25,color: Colors.red),))))
          ],
        ),

      ) );
  }
}