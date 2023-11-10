import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:nr_soporte_mobile/src/domain/models/user_model.dart';
import 'package:nr_soporte_mobile/src/domain/repository/user_repository.dart';
import 'package:nr_soporte_mobile/src/domain/utils/resource.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {

  CollectionReference _usersCollection;

  UserRepositoryImpl(this._usersCollection);

  @override
  Stream<Resource<UserModel>> getUserById(String id) {
    try {
      final data = _usersCollection.doc(id).snapshots(includeMetadataChanges: true);
      final dataMap = data.map((doc) => Success(UserModel.fromJson(doc.data() as Map<String, dynamic>)));
      return dataMap;
    } on FirebaseException catch (error) {
      throw Error(error.message ?? 'Error');
    }
  }

}