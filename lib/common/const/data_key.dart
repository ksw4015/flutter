import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

const apiUrl = 'https://api-partners.dver.link/';
const userApi = 'users/login?v=2';
const todayApi = 'bids/available/today?v=2';

final storage = FlutterSecureStorage();