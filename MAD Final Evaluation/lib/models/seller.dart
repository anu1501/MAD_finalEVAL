class Seller {
  late String _emailId;
  late String _password;
  late String _appId;
  
  get userId => this._emailId;

 set userId( value) => this._emailId = value;

  get password => this._password;

 set password( value) => this._password = value;

  get appId => this._appId;

 set appId( value) => this._appId = value;

  Seller(){}

  Seller.takeInput({required String userId,required String password,required String appId,})
  {
    this._emailId = userId;
    this._password = password;
    this._appId = appId;
  }


}