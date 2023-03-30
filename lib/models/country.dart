// To parse this JSON data, do
//
//     final country = countryFromJson(jsonString);

import 'dart:convert';

List<Country> countryFromJson(String str) =>
    List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countryToJson(List<Country> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    required this.name,
    this.tld,
    required this.cca2,
    this.ccn3,
    required this.cca3,
    this.cioc,
    this.independent,
    required this.status,
    required this.unMember,
    this.currencies,
    required this.idd,
    required this.capital,
    required this.altSpellings,
    required this.region,
    this.subregion,
    //this.languages,
    required this.translations,
    required this.latlng,
    required this.landlocked,
    this.borders,
    required this.area,
    this.demonyms,
    required this.flag,
    required this.maps,
    required this.population,
    //this.gini,
    this.fifa,
    required this.car,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    this.postalCode,
  });

  Name name;
  List<String>? tld;
  String cca2;
  String? ccn3;
  String cca3;
  String? cioc;
  bool? independent;
  Status status;
  bool unMember;
  Currencies? currencies;
  Idd idd;
  List<String>? capital;
  //String capital;
  List<String> altSpellings;
  Region region;
  String? subregion;
  // Map<String, String>? languages; problem with this
  Map<String, Translation> translations;
  List<dynamic> latlng;
  bool landlocked;
  List<String>? borders;
  dynamic area;
  Demonyms? demonyms;
  String flag;
  Maps maps;
  int population;
  //Map<String, dynamic>? gini; problem with this
  String? fifa;
  Car car;
  List<String> timezones;
  List<Continent> continents;
  Flags flags;
  CoatOfArms coatOfArms;
  StartOfWeek startOfWeek;
  CapitalInfo capitalInfo;
  PostalCode? postalCode;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
        name: Name.fromJson(json["name"]),
        tld: json["tld"] == null
            ? []
            : List<String>.from(json["tld"]!.map((x) => x)),
        cca2: json["cca2"],
        ccn3: json["ccn3"],
        cca3: json["cca3"],
        cioc: json["cioc"],
        independent: json["independent"] ?? true,
        status: statusValues.map[json["status"]]!,
        unMember: json["unMember"],
        currencies: json["currencies"] == null
            ? null
            : Currencies.fromJson(json["currencies"]),
        idd: Idd.fromJson(json["idd"]),
        capital: json["capital"] == null
            ? []
            : List<String>.from(json["capital"]!.map((x) => x)),
        //capital: (json['capital'] as List).first.toString(),
        altSpellings: List<String>.from(json["altSpellings"].map((x) => x)),
        region: regionValues.map[json["region"]]!,
        subregion: json["subregion"],
        // languages: Map.from(json["languages"])
        //     .map((k, v) => MapEntry<String, String>(k, v)),
        translations: Map.from(json["translations"]).map((k, v) =>
            MapEntry<String, Translation>(k, Translation.fromJson(v))),
        latlng: List<dynamic>.from(json["latlng"].map((x) => x)),
        landlocked: json["landlocked"],
        borders: json["borders"] == null
            ? []
            : List<String>.from(json["borders"]!.map((x) => x)),
        area: json["area"],
        demonyms: json["demonyms"] == null
            ? null
            : Demonyms.fromJson(json["demonyms"]),
        flag: json["flag"],
        maps: Maps.fromJson(json["maps"]),
        population: json["population"],
        // gini: Map.from(json["gini"]!)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v)),
        fifa: json["fifa"],
        car: Car.fromJson(json["car"]),
        timezones: List<String>.from(json["timezones"].map((x) => x)),
        continents: List<Continent>.from(
            json["continents"].map((x) => continentValues.map[x]!)),
        flags: Flags.fromJson(json["flags"]),
        coatOfArms: CoatOfArms.fromJson(json["coatOfArms"]),
        startOfWeek: startOfWeekValues.map[json["startOfWeek"]]!,
        capitalInfo: CapitalInfo.fromJson(json["capitalInfo"]),
        postalCode: json["postalCode"] == null
            ? null
            : PostalCode.fromJson(json["postalCode"]),
      );

  Map<String, dynamic> toJson() => {
        // "name": name.toJson(),
        // "tld": tld == null ? [] : List<dynamic>.from(tld!.map((x) => x)),
        "cca2": cca2,
        // "ccn3": ccn3,
        // "cca3": cca3,
        // "cioc": cioc,
        // "independent": independent,
        // "status": statusValues.reverse[status],
        // "unMember": unMember,
        // "currencies": currencies?.toJson(),
        // "idd": idd.toJson(),
        // "capital":
        //     capital == null ? [] : List<dynamic>.from(capital!.map((x) => x)),
        // "altSpellings": List<dynamic>.from(altSpellings.map((x) => x)),
        // "region": regionValues.reverse[region],
        // "subregion": subregion,
        // "languages":
        //     Map.from(languages!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        // "translations": Map.from(translations)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        // "latlng": List<dynamic>.from(latlng.map((x) => x)),
        // "landlocked": landlocked,
        // "borders":
        //     borders == null ? [] : List<dynamic>.from(borders!.map((x) => x)),
        // "area": area,
        // "demonyms": demonyms?.toJson(),
        // "flag": flag,
        // "maps": maps.toJson(),
        // "population": population,
        // "gini": Map.from(gini!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        // "fifa": fifa,
        // "car": car.toJson(),
        // "timezones": List<dynamic>.from(timezones.map((x) => x)),
        // "continents": List<dynamic>.from(
        //     continents.map((x) => continentValues.reverse[x])),
        // "flags": flags.toJson(),
        // "coatOfArms": coatOfArms.toJson(),
        // "startOfWeek": startOfWeekValues.reverse[startOfWeek],
        // "capitalInfo": capitalInfo.toJson(),
        // "postalCode": postalCode?.toJson(),
      };
}

class AreaClass {
  AreaClass({
    required this.value,
    required this.type,
  });

  String value;
  Type type;

  factory AreaClass.fromJson(Map<String, dynamic> json) => AreaClass(
        value: json["value"],
        type: typeValues.map[json["type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "type": typeValues.reverse[type],
      };
}

enum Type { BIG_NUMBER }

final typeValues = EnumValues({"Big Number": Type.BIG_NUMBER});

class CapitalInfo {
  CapitalInfo({
    this.latlng,
  });

  List<dynamic>? latlng;

  factory CapitalInfo.fromJson(Map<String, dynamic> json) => CapitalInfo(
        latlng: json["latlng"] == null
            ? []
            : List<dynamic>.from(json["latlng"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "latlng":
            latlng == null ? [] : List<dynamic>.from(latlng!.map((x) => x)),
      };
}

class Car {
  Car({
    this.signs,
    required this.side,
  });

  List<String>? signs;
  Side side;

  factory Car.fromJson(Map<String, dynamic> json) => Car(
        signs: json["signs"] == null
            ? []
            : List<String>.from(json["signs"]!.map((x) => x)),
        side: sideValues.map[json["side"]]!,
      );

  Map<String, dynamic> toJson() => {
        "signs": signs == null ? [] : List<dynamic>.from(signs!.map((x) => x)),
        "side": sideValues.reverse[side],
      };
}

enum Side { RIGHT, LEFT }

final sideValues = EnumValues({"left": Side.LEFT, "right": Side.RIGHT});

class CoatOfArms {
  CoatOfArms({
    this.png,
    this.svg,
  });

  String? png;
  String? svg;

  factory CoatOfArms.fromJson(Map<String, dynamic> json) => CoatOfArms(
        png: json["png"],
        svg: json["svg"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
      };
}

enum Continent {
  NORTH_AMERICA,
  ASIA,
  EUROPE,
  AFRICA,
  OCEANIA,
  SOUTH_AMERICA,
  ANTARCTICA
}

final continentValues = EnumValues({
  "Africa": Continent.AFRICA,
  "Antarctica": Continent.ANTARCTICA,
  "Asia": Continent.ASIA,
  "Europe": Continent.EUROPE,
  "North America": Continent.NORTH_AMERICA,
  "Oceania": Continent.OCEANIA,
  "South America": Continent.SOUTH_AMERICA
});

class Currencies {
  Currencies({
    this.gtq,
    this.sgd,
    this.bam,
    this.mvr,
    this.eur,
    this.aud,
    this.jod,
    this.bdt,
    this.usd,
    this.dzd,
    this.btn,
    this.inr,
    this.stn,
    this.xaf,
    this.xpf,
    this.nok,
    this.tvd,
    this.khr,
    this.mur,
    this.cdf,
    this.pab,
    this.nio,
    this.sll,
    this.bbd,
    this.ils,
    this.mad,
    this.mru,
    this.xcd,
    this.rwf,
    this.currenciesTry,
    this.mzn,
    this.ngn,
    this.rub,
    this.cuc,
    this.cup,
    this.gbp,
    this.jep,
    this.crc,
    this.ckd,
    this.nzd,
    this.pgk,
    this.hnl,
    this.mop,
    this.ttd,
    this.gmd,
    this.mmk,
    this.egp,
    this.lbp,
    this.kes,
    this.php,
    this.kzt,
    this.ars,
    this.tjs,
    this.azn,
    this.ron,
    this.clp,
    this.cve,
    this.bgn,
    this.uyu,
    this.mkd,
    this.afn,
    this.bwp,
    this.cad,
    this.qar,
    this.yer,
    this.sos,
    this.sek,
    this.chf,
    this.shp,
    this.mga,
    this.uah,
    this.irr,
    this.pln,
    this.vuv,
    this.pen,
    this.szl,
    this.zar,
    this.djf,
    this.htg,
    this.syp,
    this.gip,
    this.mxn,
    this.isk,
    this.fjd,
    this.kpw,
    this.sbd,
    this.gnf,
    this.bhd,
    this.gel,
    this.rsd,
    this.xof,
    this.mnt,
    this.dkk,
    this.etb,
    this.lyd,
    this.nad,
    this.mdl,
    this.bob,
    this.dop,
    this.ang,
    this.idr,
    this.byn,
    this.lrd,
    this.amd,
    this.all,
    this.ssp,
    this.ggp,
    this.aed,
    this.czk,
    this.pkr,
    this.jmd,
    this.kmf,
    this.fkp,
    this.tmt,
    this.bnd,
    this.ghs,
    this.kwd,
    this.ern,
    this.zwl,
    this.tzs,
    this.bzd,
    this.sar,
    this.cop,
    this.myr,
    this.bmd,
    this.wst,
    this.ugx,
    this.npr,
    this.pyg,
    this.fok,
    this.zmw,
    this.imp,
    this.kgs,
    this.hkd,
    this.vnd,
    this.jpy,
    this.brl,
    this.gyd,
    this.cny,
    this.awg,
    this.lak,
    this.ves,
    this.huf,
    this.top,
    this.iqd,
    this.thb,
    this.tnd,
    this.bif,
    this.kid,
    this.sdg,
    this.uzs,
    this.lkr,
    this.srd,
    this.aoa,
    this.kyd,
    this.lsl,
    this.mwk,
    this.bsd,
    this.scr,
    this.twd,
    this.krw,
    this.omr,
  });

  Aed? gtq;
  Aed? sgd;
  Bam? bam;
  Aed? mvr;
  Aed? eur;
  Aed? aud;
  Aed? jod;
  Aed? bdt;
  Aed? usd;
  Aed? dzd;
  Aed? btn;
  Aed? inr;
  Aed? stn;
  Aed? xaf;
  Aed? xpf;
  Aed? nok;
  Aed? tvd;
  Aed? khr;
  Aed? mur;
  Aed? cdf;
  Aed? pab;
  Aed? nio;
  Aed? sll;
  Aed? bbd;
  Aed? ils;
  Aed? mad;
  Aed? mru;
  Aed? xcd;
  Aed? rwf;
  Aed? currenciesTry;
  Aed? mzn;
  Aed? ngn;
  Aed? rub;
  Aed? cuc;
  Aed? cup;
  Aed? gbp;
  Aed? jep;
  Aed? crc;
  Aed? ckd;
  Aed? nzd;
  Aed? pgk;
  Aed? hnl;
  Aed? mop;
  Aed? ttd;
  Aed? gmd;
  Aed? mmk;
  Aed? egp;
  Aed? lbp;
  Aed? kes;
  Aed? php;
  Aed? kzt;
  Aed? ars;
  Aed? tjs;
  Aed? azn;
  Aed? ron;
  Aed? clp;
  Aed? cve;
  Aed? bgn;
  Aed? uyu;
  Aed? mkd;
  Aed? afn;
  Aed? bwp;
  Aed? cad;
  Aed? qar;
  Aed? yer;
  Aed? sos;
  Aed? sek;
  Aed? chf;
  Aed? shp;
  Aed? mga;
  Aed? uah;
  Aed? irr;
  Aed? pln;
  Aed? vuv;
  Aed? pen;
  Aed? szl;
  Aed? zar;
  Aed? djf;
  Aed? htg;
  Aed? syp;
  Aed? gip;
  Aed? mxn;
  Aed? isk;
  Aed? fjd;
  Aed? kpw;
  Aed? sbd;
  Aed? gnf;
  Aed? bhd;
  Aed? gel;
  Aed? rsd;
  Aed? xof;
  Aed? mnt;
  Aed? dkk;
  Aed? etb;
  Aed? lyd;
  Aed? nad;
  Aed? mdl;
  Aed? bob;
  Aed? dop;
  Aed? ang;
  Aed? idr;
  Aed? byn;
  Aed? lrd;
  Aed? amd;
  Aed? all;
  Aed? ssp;
  Aed? ggp;
  Aed? aed;
  Aed? czk;
  Aed? pkr;
  Aed? jmd;
  Aed? kmf;
  Aed? fkp;
  Aed? tmt;
  Aed? bnd;
  Aed? ghs;
  Aed? kwd;
  Aed? ern;
  Aed? zwl;
  Aed? tzs;
  Aed? bzd;
  Aed? sar;
  Aed? cop;
  Aed? myr;
  Aed? bmd;
  Aed? wst;
  Aed? ugx;
  Aed? npr;
  Aed? pyg;
  Aed? fok;
  Aed? zmw;
  Aed? imp;
  Aed? kgs;
  Aed? hkd;
  Aed? vnd;
  Aed? jpy;
  Aed? brl;
  Aed? gyd;
  Aed? cny;
  Aed? awg;
  Aed? lak;
  Aed? ves;
  Aed? huf;
  Aed? top;
  Aed? iqd;
  Aed? thb;
  Aed? tnd;
  Aed? bif;
  Aed? kid;
  Bam? sdg;
  Aed? uzs;
  Aed? lkr;
  Aed? srd;
  Aed? aoa;
  Aed? kyd;
  Aed? lsl;
  Aed? mwk;
  Aed? bsd;
  Aed? scr;
  Aed? twd;
  Aed? krw;
  Aed? omr;

  factory Currencies.fromJson(Map<String, dynamic> json) => Currencies(
        gtq: json["GTQ"] == null ? null : Aed.fromJson(json["GTQ"]),
        sgd: json["SGD"] == null ? null : Aed.fromJson(json["SGD"]),
        bam: json["BAM"] == null ? null : Bam.fromJson(json["BAM"]),
        mvr: json["MVR"] == null ? null : Aed.fromJson(json["MVR"]),
        eur: json["EUR"] == null ? null : Aed.fromJson(json["EUR"]),
        aud: json["AUD"] == null ? null : Aed.fromJson(json["AUD"]),
        jod: json["JOD"] == null ? null : Aed.fromJson(json["JOD"]),
        bdt: json["BDT"] == null ? null : Aed.fromJson(json["BDT"]),
        usd: json["USD"] == null ? null : Aed.fromJson(json["USD"]),
        dzd: json["DZD"] == null ? null : Aed.fromJson(json["DZD"]),
        btn: json["BTN"] == null ? null : Aed.fromJson(json["BTN"]),
        inr: json["INR"] == null ? null : Aed.fromJson(json["INR"]),
        stn: json["STN"] == null ? null : Aed.fromJson(json["STN"]),
        xaf: json["XAF"] == null ? null : Aed.fromJson(json["XAF"]),
        xpf: json["XPF"] == null ? null : Aed.fromJson(json["XPF"]),
        nok: json["NOK"] == null ? null : Aed.fromJson(json["NOK"]),
        tvd: json["TVD"] == null ? null : Aed.fromJson(json["TVD"]),
        khr: json["KHR"] == null ? null : Aed.fromJson(json["KHR"]),
        mur: json["MUR"] == null ? null : Aed.fromJson(json["MUR"]),
        cdf: json["CDF"] == null ? null : Aed.fromJson(json["CDF"]),
        pab: json["PAB"] == null ? null : Aed.fromJson(json["PAB"]),
        nio: json["NIO"] == null ? null : Aed.fromJson(json["NIO"]),
        sll: json["SLL"] == null ? null : Aed.fromJson(json["SLL"]),
        bbd: json["BBD"] == null ? null : Aed.fromJson(json["BBD"]),
        ils: json["ILS"] == null ? null : Aed.fromJson(json["ILS"]),
        mad: json["MAD"] == null ? null : Aed.fromJson(json["MAD"]),
        mru: json["MRU"] == null ? null : Aed.fromJson(json["MRU"]),
        xcd: json["XCD"] == null ? null : Aed.fromJson(json["XCD"]),
        rwf: json["RWF"] == null ? null : Aed.fromJson(json["RWF"]),
        currenciesTry: json["TRY"] == null ? null : Aed.fromJson(json["TRY"]),
        mzn: json["MZN"] == null ? null : Aed.fromJson(json["MZN"]),
        ngn: json["NGN"] == null ? null : Aed.fromJson(json["NGN"]),
        rub: json["RUB"] == null ? null : Aed.fromJson(json["RUB"]),
        cuc: json["CUC"] == null ? null : Aed.fromJson(json["CUC"]),
        cup: json["CUP"] == null ? null : Aed.fromJson(json["CUP"]),
        gbp: json["GBP"] == null ? null : Aed.fromJson(json["GBP"]),
        jep: json["JEP"] == null ? null : Aed.fromJson(json["JEP"]),
        crc: json["CRC"] == null ? null : Aed.fromJson(json["CRC"]),
        ckd: json["CKD"] == null ? null : Aed.fromJson(json["CKD"]),
        nzd: json["NZD"] == null ? null : Aed.fromJson(json["NZD"]),
        pgk: json["PGK"] == null ? null : Aed.fromJson(json["PGK"]),
        hnl: json["HNL"] == null ? null : Aed.fromJson(json["HNL"]),
        mop: json["MOP"] == null ? null : Aed.fromJson(json["MOP"]),
        ttd: json["TTD"] == null ? null : Aed.fromJson(json["TTD"]),
        gmd: json["GMD"] == null ? null : Aed.fromJson(json["GMD"]),
        mmk: json["MMK"] == null ? null : Aed.fromJson(json["MMK"]),
        egp: json["EGP"] == null ? null : Aed.fromJson(json["EGP"]),
        lbp: json["LBP"] == null ? null : Aed.fromJson(json["LBP"]),
        kes: json["KES"] == null ? null : Aed.fromJson(json["KES"]),
        php: json["PHP"] == null ? null : Aed.fromJson(json["PHP"]),
        kzt: json["KZT"] == null ? null : Aed.fromJson(json["KZT"]),
        ars: json["ARS"] == null ? null : Aed.fromJson(json["ARS"]),
        tjs: json["TJS"] == null ? null : Aed.fromJson(json["TJS"]),
        azn: json["AZN"] == null ? null : Aed.fromJson(json["AZN"]),
        ron: json["RON"] == null ? null : Aed.fromJson(json["RON"]),
        clp: json["CLP"] == null ? null : Aed.fromJson(json["CLP"]),
        cve: json["CVE"] == null ? null : Aed.fromJson(json["CVE"]),
        bgn: json["BGN"] == null ? null : Aed.fromJson(json["BGN"]),
        uyu: json["UYU"] == null ? null : Aed.fromJson(json["UYU"]),
        mkd: json["MKD"] == null ? null : Aed.fromJson(json["MKD"]),
        afn: json["AFN"] == null ? null : Aed.fromJson(json["AFN"]),
        bwp: json["BWP"] == null ? null : Aed.fromJson(json["BWP"]),
        cad: json["CAD"] == null ? null : Aed.fromJson(json["CAD"]),
        qar: json["QAR"] == null ? null : Aed.fromJson(json["QAR"]),
        yer: json["YER"] == null ? null : Aed.fromJson(json["YER"]),
        sos: json["SOS"] == null ? null : Aed.fromJson(json["SOS"]),
        sek: json["SEK"] == null ? null : Aed.fromJson(json["SEK"]),
        chf: json["CHF"] == null ? null : Aed.fromJson(json["CHF"]),
        shp: json["SHP"] == null ? null : Aed.fromJson(json["SHP"]),
        mga: json["MGA"] == null ? null : Aed.fromJson(json["MGA"]),
        uah: json["UAH"] == null ? null : Aed.fromJson(json["UAH"]),
        irr: json["IRR"] == null ? null : Aed.fromJson(json["IRR"]),
        pln: json["PLN"] == null ? null : Aed.fromJson(json["PLN"]),
        vuv: json["VUV"] == null ? null : Aed.fromJson(json["VUV"]),
        pen: json["PEN"] == null ? null : Aed.fromJson(json["PEN"]),
        szl: json["SZL"] == null ? null : Aed.fromJson(json["SZL"]),
        zar: json["ZAR"] == null ? null : Aed.fromJson(json["ZAR"]),
        djf: json["DJF"] == null ? null : Aed.fromJson(json["DJF"]),
        htg: json["HTG"] == null ? null : Aed.fromJson(json["HTG"]),
        syp: json["SYP"] == null ? null : Aed.fromJson(json["SYP"]),
        gip: json["GIP"] == null ? null : Aed.fromJson(json["GIP"]),
        mxn: json["MXN"] == null ? null : Aed.fromJson(json["MXN"]),
        isk: json["ISK"] == null ? null : Aed.fromJson(json["ISK"]),
        fjd: json["FJD"] == null ? null : Aed.fromJson(json["FJD"]),
        kpw: json["KPW"] == null ? null : Aed.fromJson(json["KPW"]),
        sbd: json["SBD"] == null ? null : Aed.fromJson(json["SBD"]),
        gnf: json["GNF"] == null ? null : Aed.fromJson(json["GNF"]),
        bhd: json["BHD"] == null ? null : Aed.fromJson(json["BHD"]),
        gel: json["GEL"] == null ? null : Aed.fromJson(json["GEL"]),
        rsd: json["RSD"] == null ? null : Aed.fromJson(json["RSD"]),
        xof: json["XOF"] == null ? null : Aed.fromJson(json["XOF"]),
        mnt: json["MNT"] == null ? null : Aed.fromJson(json["MNT"]),
        dkk: json["DKK"] == null ? null : Aed.fromJson(json["DKK"]),
        etb: json["ETB"] == null ? null : Aed.fromJson(json["ETB"]),
        lyd: json["LYD"] == null ? null : Aed.fromJson(json["LYD"]),
        nad: json["NAD"] == null ? null : Aed.fromJson(json["NAD"]),
        mdl: json["MDL"] == null ? null : Aed.fromJson(json["MDL"]),
        bob: json["BOB"] == null ? null : Aed.fromJson(json["BOB"]),
        dop: json["DOP"] == null ? null : Aed.fromJson(json["DOP"]),
        ang: json["ANG"] == null ? null : Aed.fromJson(json["ANG"]),
        idr: json["IDR"] == null ? null : Aed.fromJson(json["IDR"]),
        byn: json["BYN"] == null ? null : Aed.fromJson(json["BYN"]),
        lrd: json["LRD"] == null ? null : Aed.fromJson(json["LRD"]),
        amd: json["AMD"] == null ? null : Aed.fromJson(json["AMD"]),
        all: json["ALL"] == null ? null : Aed.fromJson(json["ALL"]),
        ssp: json["SSP"] == null ? null : Aed.fromJson(json["SSP"]),
        ggp: json["GGP"] == null ? null : Aed.fromJson(json["GGP"]),
        aed: json["AED"] == null ? null : Aed.fromJson(json["AED"]),
        czk: json["CZK"] == null ? null : Aed.fromJson(json["CZK"]),
        pkr: json["PKR"] == null ? null : Aed.fromJson(json["PKR"]),
        jmd: json["JMD"] == null ? null : Aed.fromJson(json["JMD"]),
        kmf: json["KMF"] == null ? null : Aed.fromJson(json["KMF"]),
        fkp: json["FKP"] == null ? null : Aed.fromJson(json["FKP"]),
        tmt: json["TMT"] == null ? null : Aed.fromJson(json["TMT"]),
        bnd: json["BND"] == null ? null : Aed.fromJson(json["BND"]),
        ghs: json["GHS"] == null ? null : Aed.fromJson(json["GHS"]),
        kwd: json["KWD"] == null ? null : Aed.fromJson(json["KWD"]),
        ern: json["ERN"] == null ? null : Aed.fromJson(json["ERN"]),
        zwl: json["ZWL"] == null ? null : Aed.fromJson(json["ZWL"]),
        tzs: json["TZS"] == null ? null : Aed.fromJson(json["TZS"]),
        bzd: json["BZD"] == null ? null : Aed.fromJson(json["BZD"]),
        sar: json["SAR"] == null ? null : Aed.fromJson(json["SAR"]),
        cop: json["COP"] == null ? null : Aed.fromJson(json["COP"]),
        myr: json["MYR"] == null ? null : Aed.fromJson(json["MYR"]),
        bmd: json["BMD"] == null ? null : Aed.fromJson(json["BMD"]),
        wst: json["WST"] == null ? null : Aed.fromJson(json["WST"]),
        ugx: json["UGX"] == null ? null : Aed.fromJson(json["UGX"]),
        npr: json["NPR"] == null ? null : Aed.fromJson(json["NPR"]),
        pyg: json["PYG"] == null ? null : Aed.fromJson(json["PYG"]),
        fok: json["FOK"] == null ? null : Aed.fromJson(json["FOK"]),
        zmw: json["ZMW"] == null ? null : Aed.fromJson(json["ZMW"]),
        imp: json["IMP"] == null ? null : Aed.fromJson(json["IMP"]),
        kgs: json["KGS"] == null ? null : Aed.fromJson(json["KGS"]),
        hkd: json["HKD"] == null ? null : Aed.fromJson(json["HKD"]),
        vnd: json["VND"] == null ? null : Aed.fromJson(json["VND"]),
        jpy: json["JPY"] == null ? null : Aed.fromJson(json["JPY"]),
        brl: json["BRL"] == null ? null : Aed.fromJson(json["BRL"]),
        gyd: json["GYD"] == null ? null : Aed.fromJson(json["GYD"]),
        cny: json["CNY"] == null ? null : Aed.fromJson(json["CNY"]),
        awg: json["AWG"] == null ? null : Aed.fromJson(json["AWG"]),
        lak: json["LAK"] == null ? null : Aed.fromJson(json["LAK"]),
        ves: json["VES"] == null ? null : Aed.fromJson(json["VES"]),
        huf: json["HUF"] == null ? null : Aed.fromJson(json["HUF"]),
        top: json["TOP"] == null ? null : Aed.fromJson(json["TOP"]),
        iqd: json["IQD"] == null ? null : Aed.fromJson(json["IQD"]),
        thb: json["THB"] == null ? null : Aed.fromJson(json["THB"]),
        tnd: json["TND"] == null ? null : Aed.fromJson(json["TND"]),
        bif: json["BIF"] == null ? null : Aed.fromJson(json["BIF"]),
        kid: json["KID"] == null ? null : Aed.fromJson(json["KID"]),
        sdg: json["SDG"] == null ? null : Bam.fromJson(json["SDG"]),
        uzs: json["UZS"] == null ? null : Aed.fromJson(json["UZS"]),
        lkr: json["LKR"] == null ? null : Aed.fromJson(json["LKR"]),
        srd: json["SRD"] == null ? null : Aed.fromJson(json["SRD"]),
        aoa: json["AOA"] == null ? null : Aed.fromJson(json["AOA"]),
        kyd: json["KYD"] == null ? null : Aed.fromJson(json["KYD"]),
        lsl: json["LSL"] == null ? null : Aed.fromJson(json["LSL"]),
        mwk: json["MWK"] == null ? null : Aed.fromJson(json["MWK"]),
        bsd: json["BSD"] == null ? null : Aed.fromJson(json["BSD"]),
        scr: json["SCR"] == null ? null : Aed.fromJson(json["SCR"]),
        twd: json["TWD"] == null ? null : Aed.fromJson(json["TWD"]),
        krw: json["KRW"] == null ? null : Aed.fromJson(json["KRW"]),
        omr: json["OMR"] == null ? null : Aed.fromJson(json["OMR"]),
      );

  Map<String, dynamic> toJson() => {
        "GTQ": gtq?.toJson(),
        "SGD": sgd?.toJson(),
        "BAM": bam?.toJson(),
        "MVR": mvr?.toJson(),
        "EUR": eur?.toJson(),
        "AUD": aud?.toJson(),
        "JOD": jod?.toJson(),
        "BDT": bdt?.toJson(),
        "USD": usd?.toJson(),
        "DZD": dzd?.toJson(),
        "BTN": btn?.toJson(),
        "INR": inr?.toJson(),
        "STN": stn?.toJson(),
        "XAF": xaf?.toJson(),
        "XPF": xpf?.toJson(),
        "NOK": nok?.toJson(),
        "TVD": tvd?.toJson(),
        "KHR": khr?.toJson(),
        "MUR": mur?.toJson(),
        "CDF": cdf?.toJson(),
        "PAB": pab?.toJson(),
        "NIO": nio?.toJson(),
        "SLL": sll?.toJson(),
        "BBD": bbd?.toJson(),
        "ILS": ils?.toJson(),
        "MAD": mad?.toJson(),
        "MRU": mru?.toJson(),
        "XCD": xcd?.toJson(),
        "RWF": rwf?.toJson(),
        "TRY": currenciesTry?.toJson(),
        "MZN": mzn?.toJson(),
        "NGN": ngn?.toJson(),
        "RUB": rub?.toJson(),
        "CUC": cuc?.toJson(),
        "CUP": cup?.toJson(),
        "GBP": gbp?.toJson(),
        "JEP": jep?.toJson(),
        "CRC": crc?.toJson(),
        "CKD": ckd?.toJson(),
        "NZD": nzd?.toJson(),
        "PGK": pgk?.toJson(),
        "HNL": hnl?.toJson(),
        "MOP": mop?.toJson(),
        "TTD": ttd?.toJson(),
        "GMD": gmd?.toJson(),
        "MMK": mmk?.toJson(),
        "EGP": egp?.toJson(),
        "LBP": lbp?.toJson(),
        "KES": kes?.toJson(),
        "PHP": php?.toJson(),
        "KZT": kzt?.toJson(),
        "ARS": ars?.toJson(),
        "TJS": tjs?.toJson(),
        "AZN": azn?.toJson(),
        "RON": ron?.toJson(),
        "CLP": clp?.toJson(),
        "CVE": cve?.toJson(),
        "BGN": bgn?.toJson(),
        "UYU": uyu?.toJson(),
        "MKD": mkd?.toJson(),
        "AFN": afn?.toJson(),
        "BWP": bwp?.toJson(),
        "CAD": cad?.toJson(),
        "QAR": qar?.toJson(),
        "YER": yer?.toJson(),
        "SOS": sos?.toJson(),
        "SEK": sek?.toJson(),
        "CHF": chf?.toJson(),
        "SHP": shp?.toJson(),
        "MGA": mga?.toJson(),
        "UAH": uah?.toJson(),
        "IRR": irr?.toJson(),
        "PLN": pln?.toJson(),
        "VUV": vuv?.toJson(),
        "PEN": pen?.toJson(),
        "SZL": szl?.toJson(),
        "ZAR": zar?.toJson(),
        "DJF": djf?.toJson(),
        "HTG": htg?.toJson(),
        "SYP": syp?.toJson(),
        "GIP": gip?.toJson(),
        "MXN": mxn?.toJson(),
        "ISK": isk?.toJson(),
        "FJD": fjd?.toJson(),
        "KPW": kpw?.toJson(),
        "SBD": sbd?.toJson(),
        "GNF": gnf?.toJson(),
        "BHD": bhd?.toJson(),
        "GEL": gel?.toJson(),
        "RSD": rsd?.toJson(),
        "XOF": xof?.toJson(),
        "MNT": mnt?.toJson(),
        "DKK": dkk?.toJson(),
        "ETB": etb?.toJson(),
        "LYD": lyd?.toJson(),
        "NAD": nad?.toJson(),
        "MDL": mdl?.toJson(),
        "BOB": bob?.toJson(),
        "DOP": dop?.toJson(),
        "ANG": ang?.toJson(),
        "IDR": idr?.toJson(),
        "BYN": byn?.toJson(),
        "LRD": lrd?.toJson(),
        "AMD": amd?.toJson(),
        "ALL": all?.toJson(),
        "SSP": ssp?.toJson(),
        "GGP": ggp?.toJson(),
        "AED": aed?.toJson(),
        "CZK": czk?.toJson(),
        "PKR": pkr?.toJson(),
        "JMD": jmd?.toJson(),
        "KMF": kmf?.toJson(),
        "FKP": fkp?.toJson(),
        "TMT": tmt?.toJson(),
        "BND": bnd?.toJson(),
        "GHS": ghs?.toJson(),
        "KWD": kwd?.toJson(),
        "ERN": ern?.toJson(),
        "ZWL": zwl?.toJson(),
        "TZS": tzs?.toJson(),
        "BZD": bzd?.toJson(),
        "SAR": sar?.toJson(),
        "COP": cop?.toJson(),
        "MYR": myr?.toJson(),
        "BMD": bmd?.toJson(),
        "WST": wst?.toJson(),
        "UGX": ugx?.toJson(),
        "NPR": npr?.toJson(),
        "PYG": pyg?.toJson(),
        "FOK": fok?.toJson(),
        "ZMW": zmw?.toJson(),
        "IMP": imp?.toJson(),
        "KGS": kgs?.toJson(),
        "HKD": hkd?.toJson(),
        "VND": vnd?.toJson(),
        "JPY": jpy?.toJson(),
        "BRL": brl?.toJson(),
        "GYD": gyd?.toJson(),
        "CNY": cny?.toJson(),
        "AWG": awg?.toJson(),
        "LAK": lak?.toJson(),
        "VES": ves?.toJson(),
        "HUF": huf?.toJson(),
        "TOP": top?.toJson(),
        "IQD": iqd?.toJson(),
        "THB": thb?.toJson(),
        "TND": tnd?.toJson(),
        "BIF": bif?.toJson(),
        "KID": kid?.toJson(),
        "SDG": sdg?.toJson(),
        "UZS": uzs?.toJson(),
        "LKR": lkr?.toJson(),
        "SRD": srd?.toJson(),
        "AOA": aoa?.toJson(),
        "KYD": kyd?.toJson(),
        "LSL": lsl?.toJson(),
        "MWK": mwk?.toJson(),
        "BSD": bsd?.toJson(),
        "SCR": scr?.toJson(),
        "TWD": twd?.toJson(),
        "KRW": krw?.toJson(),
        "OMR": omr?.toJson(),
      };
}

class Aed {
  Aed({
    required this.name,
    required this.symbol,
  });

  String name;
  String symbol;

  factory Aed.fromJson(Map<String, dynamic> json) => Aed(
        name: json["name"],
        symbol: json["symbol"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "symbol": symbol,
      };
}

class Bam {
  Bam({
    required this.name,
  });

  String name;

  factory Bam.fromJson(Map<String, dynamic> json) => Bam(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Demonyms {
  Demonyms({
    required this.eng,
    this.fra,
  });

  Eng eng;
  Eng? fra;

  factory Demonyms.fromJson(Map<String, dynamic> json) => Demonyms(
        eng: Eng.fromJson(json["eng"]),
        fra: json["fra"] == null ? null : Eng.fromJson(json["fra"]),
      );

  Map<String, dynamic> toJson() => {
        "eng": eng.toJson(),
        "fra": fra?.toJson(),
      };
}

class Eng {
  Eng({
    required this.f,
    required this.m,
  });

  String f;
  String m;

  factory Eng.fromJson(Map<String, dynamic> json) => Eng(
        f: json["f"],
        m: json["m"],
      );

  Map<String, dynamic> toJson() => {
        "f": f,
        "m": m,
      };
}

class Flags {
  Flags({
    required this.png,
    required this.svg,
    this.alt,
  });

  String png;
  String svg;
  String? alt;

  factory Flags.fromJson(Map<String, dynamic> json) => Flags(
        png: json["png"],
        svg: json["svg"],
        alt: json["alt"],
      );

  Map<String, dynamic> toJson() => {
        "png": png,
        "svg": svg,
        "alt": alt,
      };
}

class Idd {
  Idd({
    this.root,
    this.suffixes,
  });

  String? root;
  List<String>? suffixes;

  factory Idd.fromJson(Map<String, dynamic> json) => Idd(
        root: json["root"],
        suffixes: json["suffixes"] == null
            ? []
            : List<String>.from(json["suffixes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "root": root,
        "suffixes":
            suffixes == null ? [] : List<dynamic>.from(suffixes!.map((x) => x)),
      };
}

class Maps {
  Maps({
    required this.googleMaps,
    required this.openStreetMaps,
  });

  String googleMaps;
  String openStreetMaps;

  factory Maps.fromJson(Map<String, dynamic> json) => Maps(
        googleMaps: json["googleMaps"],
        openStreetMaps: json["openStreetMaps"],
      );

  Map<String, dynamic> toJson() => {
        "googleMaps": googleMaps,
        "openStreetMaps": openStreetMaps,
      };
}

class Name {
  Name({
    required this.common,
    required this.official,
    this.nativeName,
  });

  String common;
  String official;
  Map<String, Translation>? nativeName;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        common: json["common"],
        official: json["official"],
        // nativeName: Map.from(json["nativeName"]!).map((k, v) =>
        //     MapEntry<String, Translation>(k, Translation.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "common": common,
        "official": official,
        "nativeName": Map.from(nativeName!)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Translation {
  Translation({
    required this.official,
    required this.common,
  });

  String official;
  String common;

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        official: json["official"],
        common: json["common"],
      );

  Map<String, dynamic> toJson() => {
        "official": official,
        "common": common,
      };
}

class PostalCode {
  PostalCode({
    required this.format,
    this.regex,
  });

  String format;
  String? regex;

  factory PostalCode.fromJson(Map<String, dynamic> json) => PostalCode(
        format: json["format"],
        regex: json["regex"],
      );

  Map<String, dynamic> toJson() => {
        "format": format,
        "regex": regex,
      };
}

enum Region { AMERICAS, ASIA, EUROPE, OCEANIA, AFRICA, ANTARCTIC }

final regionValues = EnumValues({
  "Africa": Region.AFRICA,
  "Americas": Region.AMERICAS,
  "Antarctic": Region.ANTARCTIC,
  "Asia": Region.ASIA,
  "Europe": Region.EUROPE,
  "Oceania": Region.OCEANIA
});

enum StartOfWeek { MONDAY, SUNDAY, SATURDAY }

final startOfWeekValues = EnumValues({
  "monday": StartOfWeek.MONDAY,
  "saturday": StartOfWeek.SATURDAY,
  "sunday": StartOfWeek.SUNDAY
});

enum Status { OFFICIALLY_ASSIGNED, USER_ASSIGNED }

final statusValues = EnumValues({
  "officially-assigned": Status.OFFICIALLY_ASSIGNED,
  "user-assigned": Status.USER_ASSIGNED
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
