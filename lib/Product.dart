class Product {
  String _nom="";
  double _prix=0;
  int _Q=0;
 Product(String N,double P,int q){
  this._nom=N;
  this._prix=P;
  this._Q=q;
 }
 double calculerPrixTotal(){
  return this._prix*this._Q;
 }
 String getNom(){
  return this._nom;
 }
  double getPrix(){
  return this._prix;
 }
  int getQuantite(){
  return this._Q;
 }
 void setQuantite(int q){
  this._Q=q;
 }
}