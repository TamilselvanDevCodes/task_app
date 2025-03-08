import 'package:connectivity_plus/connectivity_plus.dart' ;
import '../variables/global_variables.dart';

class NetworkConnectivity{
  static  Connectivity connectivity = Connectivity();
  static Future<bool> isConnected()async{
    bool isConnected=false;
    try{
      var connectivityResult = await connectivity.checkConnectivity();
      isConnected= connectivityResult.contains(ConnectivityResult.none)?false:true;
      logger.d("connectivityResult : $connectivityResult");
    }
    catch (error, stackTrace) {
      logger.e("Error in $NetworkConnectivity : $error\nStack Trace : $stackTrace");
    }
    return isConnected;
  }



}