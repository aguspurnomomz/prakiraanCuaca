import 'package:aplikasi_cuaca/datamodel/parsingdata.dart';
import 'package:flutter/material.dart';

kodeCuaca(code){
  String kode = "";

  // inisialisasi kode dari BMKG ke string lokal
  switch (code){
    case "0": kode = 'Cerah';
    break;
    case "1": kode = 'Cerah Berawan';
    break;
    case "2": kode = 'Cerah Berawan';
    break;
    case "3": kode = 'Berawan';
    break;
    case "4": kode = 'Berawan Tebal';
    break;
    case "5": kode = 'Udara Kabur';
    break;
    case "10": kode = 'Asap';
    break;
    case "45": kode = 'Kabut';
    break;
    case "60": kode = 'Hujan Ringan';
    break;
    case "61": kode = 'Hujan Sedang';
    break;
    case "63": kode = 'Hujan Lebat';
    break;
    case "200": kode = 'Hujan Lokal';
    break;
    case "95": kode = 'Hujan Petir';
    break;
    case "97": kode = 'Hujan Petir';
    break;
  }
  return kode;
}

iconCuaca (code, int i){
  var icon = CircleAvatar(
    backgroundColor: Colors.transparent,
    radius: 20,
    child: Image.asset('assets/icon_cuaca/sun.png'),
  );

  switch (code){
    //cereah
    case "0" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/sun.png'),
    );
    break;
    //cerah berawan
    case "1" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/partly-cloudy.png'),
    );
    break;
    //cerah berawan
    case "2" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/partly-cloudy.png'),
    );
    break;
    //berawan
    case "3" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/weather.png'),
    );
    break;
    //awan tebal
    case "4" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/overcast.png'),
    );
    break;
    //udara kabur
    case "5" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/haze.png'),
    );
    break;
    //asap
    case "10" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/smoke.png'),
    );
    break;
    //berkabut
    case "45" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/smoke.png'),
    );
    break;
    //hujan ringan
    case "60" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/light-rain.png'),
    );
    break;
    //hujan sedang
    case "61" : icon = CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Image.asset('assets/icon_cuaca/light-rain.png'),
        );
    break;
    //hujan lebat
    case "63" : icon = CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 20,
      child: Image.asset('assets/icon_cuaca/heavy-rain.png')
    );
    break;
    //hujan lokal
    case "200" : icon = CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.asset('assets/icon_cuaca/isolated-shower.png')
        );
    break;
    //hujan petir
    case "95" : icon = CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.asset('assets/icon_cuaca/storm.png')
        );
    break;
    //hujan petir
    case "97" : icon =
        CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: Image.asset('assets/icon_cuaca/storm.png')
        );
    
    break;
  }
  return icon;
}