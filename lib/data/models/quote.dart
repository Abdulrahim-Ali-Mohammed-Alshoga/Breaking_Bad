class Quote{
  late String quote;
  Quote(this.quote);
  Quote.formJson(Map<String, dynamic> json){
    quote=json['quote'];
  }
}