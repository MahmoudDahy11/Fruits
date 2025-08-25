import 'package:e_commerce_app/features/auth/domain/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String email;
  final String name;
  final String uId;

  UserModel({required this.email, required this.name, required this.uId});
  factory UserModel.fromFireBase(User user) {
    return UserModel(
      email: user.email ?? '',
      name: user.displayName ?? '',
      uId: user.uid,
    );
  }

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(email: user.email, name: user.name, uId: user.uId);
  }
  
  UserEntity toEntity() {
    return UserEntity(name: name, email: email, uId: uId);
  }
}
