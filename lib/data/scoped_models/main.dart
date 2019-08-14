import 'package:pt_project_1/data/scoped_models/Social_App_connected_models.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with SocialAppConnectedModel, Album_model, Category_model, Utility_model, User_model{
  
}