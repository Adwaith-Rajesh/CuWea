// weather api code -> open weather map api code
const Map<String, String> weatherApiToOwm = {
  '1000': '01d',
  '1003': '02d',
  '1006': '03d',
  '1009': '03d',
  '1030': '50d',
  '1063': '09d',
  '1066': '13d',
  '1069': '13d',
  '1072': '13d',
  '1087': '11d',
  '1114': '13d',
  '1117': '50d',
  '1135': '50d',
  '1147': '50d',
  '1150': '9d',
  '1153': '9d',
  '1168': '9d',
  '1171': '9d',
  '1180': '10d',
  '1183': '10d',
  '1186': '10d',
  '1189': '10d',
  '1192': '10d',
  '1195': '10d',
  '1198': '13d',
  '1201': '13d',
  '1204': '13d',
  '1207': '13d',
  '1210': '13d',
  '1213': '13d',
  '1216': '13d',
  '1219': '13d',
  '1222': '13d',
  '1225': '13d',
  '1237': '13d',
  '1240': '10d',
  '1243': '10d',
  '1246': '10d',
  '1249': '13d',
  '1252': '13d',
  '1255': '13d',
  '1258': '13d',
  '1261': '13d',
  '1264': '13d',
  '1273': '11d',
  '1276': '11d',
  '1279': '13d',
  '1282': '13d',
};

String getIconImagePath(String code, int size) {
  var val = weatherApiToOwm[code];
  if (val == null) {
    return 'assets/images/owm/${size}x/01d.png';
  }
  return 'assets/images/owm/${size}x/$val.png';
}
