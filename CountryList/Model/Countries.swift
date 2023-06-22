//
//  Countries.swift
//  County List
//
//  Created by Nicol Vishan on 12/10/22.
//

import Foundation

struct Countries: Codable {
    let name: Name
    let currencies: Currencies?
    let capital: [String]?
    let region: String
    let subregion: String?
    let languages: [String:String]?
    let flag: String
    let population: Int
    let timezones: [String]
    let continents: [Continent]
    let flags,coatOfArms: CoatOfArms
}

struct Name: Codable {
    let common, official: String
    let nativeName: [String: Translation]?
}

struct Translation: Codable {
    let official, common: String
}

enum Continent: String, Codable {
    case africa = "Africa"
    case antarctica = "Antarctica"
    case asia = "Asia"
    case europe = "Europe"
    case northAmerica = "North America"
    case oceania = "Oceania"
    case southAmerica = "South America"
}

struct CoatOfArms: Codable {
    let png: String?
    let svg: String?
}

struct Aed: Codable {
    let name, symbol: String
}

struct BAM: Codable {
    let name: String
}

struct Currencies: Codable {
    let isk, eur, iqd, mwk: Aed?
    let hkd, pyg, djf, mga: Aed?
    let npr, dkk, nok, aud: Aed?
    let tvd, lbp, xof, cve: Aed?
    let gip, dzd, gel, mnt: Aed?
    let irr, nzd, sgd, usd: Aed?
    let nio, mdl, yer, gmd: Aed?
    let kgs, cuc, cup, ern: Aed?
    let krw, ghs, egp, xaf: Aed?
    let twd, ckd, szl, zar: Aed?
    let omr, uyu, bsd, brl: Aed?
    let mmk, sek, vnd, awg: Aed?
    let ils, jod, pen, xcd: Aed?
    let bif, gtq, xpf, shp: Aed?
    let lak, sll, inr, jmd: Aed?
    let mkd, cad, lrd, bhd: Aed?
    let bmd, myr, kid, uah: Aed?
    let fok, afn, stn, kwd: Aed?
    let pln, vuv, kmf, cny: Aed?
    let mad, mru, pab, sbd: Aed?
    let crc, pgk, jpy, ssp: Aed?
    let gbp, ang, ves, thb: Aed?
    let php, bnd, chf, cop: Aed?
    let bzd, bob, rub, tzs: Aed?
    let zwl, azn, mur, amd: Aed?
    let czk, htg, lkr, all: Aed?
    let syp, btn, jep, tnd: Aed?
    let wst, currenciesTRY, aed: Aed?
    let bam: BAM?
    let bwp, ggp, scr, aoa: Aed?
    let qar, nad, khr, gnf: Aed?
    let uzs, zmw, sos, bgn: Aed?
    let rwf, gyd, mxn, cdf: Aed?
    let etb, mop, pkr, idr: Aed?
    let ars, ron, ugx, srd: Aed?
    let mvr, fjd, ttd, top: Aed?
    let clp: Aed?
    let sdg: BAM?
    let lsl, fkp, mzn, tjs: Aed?
    let kpw, rsd, hnl, kes: Aed?
    let byn, dop, sar, bdt: Aed?
    let bbd, imp, kzt, lyd: Aed?
    let kyd, ngn, hrk, huf: Aed?
    let tmt: Aed?

    enum CodingKeys: String, CodingKey {
        case isk = "ISK"
        case eur = "EUR"
        case iqd = "IQD"
        case mwk = "MWK"
        case hkd = "HKD"
        case pyg = "PYG"
        case djf = "DJF"
        case mga = "MGA"
        case npr = "NPR"
        case dkk = "DKK"
        case nok = "NOK"
        case aud = "AUD"
        case tvd = "TVD"
        case lbp = "LBP"
        case xof = "XOF"
        case cve = "CVE"
        case gip = "GIP"
        case dzd = "DZD"
        case gel = "GEL"
        case mnt = "MNT"
        case irr = "IRR"
        case nzd = "NZD"
        case sgd = "SGD"
        case usd = "USD"
        case nio = "NIO"
        case mdl = "MDL"
        case yer = "YER"
        case gmd = "GMD"
        case kgs = "KGS"
        case cuc = "CUC"
        case cup = "CUP"
        case ern = "ERN"
        case krw = "KRW"
        case ghs = "GHS"
        case egp = "EGP"
        case xaf = "XAF"
        case twd = "TWD"
        case ckd = "CKD"
        case szl = "SZL"
        case zar = "ZAR"
        case omr = "OMR"
        case uyu = "UYU"
        case bsd = "BSD"
        case brl = "BRL"
        case mmk = "MMK"
        case sek = "SEK"
        case vnd = "VND"
        case awg = "AWG"
        case ils = "ILS"
        case jod = "JOD"
        case pen = "PEN"
        case xcd = "XCD"
        case bif = "BIF"
        case gtq = "GTQ"
        case xpf = "XPF"
        case shp = "SHP"
        case lak = "LAK"
        case sll = "SLL"
        case inr = "INR"
        case jmd = "JMD"
        case mkd = "MKD"
        case cad = "CAD"
        case lrd = "LRD"
        case bhd = "BHD"
        case bmd = "BMD"
        case myr = "MYR"
        case kid = "KID"
        case uah = "UAH"
        case fok = "FOK"
        case afn = "AFN"
        case stn = "STN"
        case kwd = "KWD"
        case pln = "PLN"
        case vuv = "VUV"
        case kmf = "KMF"
        case cny = "CNY"
        case mad = "MAD"
        case mru = "MRU"
        case pab = "PAB"
        case sbd = "SBD"
        case crc = "CRC"
        case pgk = "PGK"
        case jpy = "JPY"
        case ssp = "SSP"
        case gbp = "GBP"
        case ang = "ANG"
        case ves = "VES"
        case thb = "THB"
        case php = "PHP"
        case bnd = "BND"
        case chf = "CHF"
        case cop = "COP"
        case bzd = "BZD"
        case bob = "BOB"
        case rub = "RUB"
        case tzs = "TZS"
        case zwl = "ZWL"
        case azn = "AZN"
        case mur = "MUR"
        case amd = "AMD"
        case czk = "CZK"
        case htg = "HTG"
        case lkr = "LKR"
        case all = "ALL"
        case syp = "SYP"
        case btn = "BTN"
        case jep = "JEP"
        case tnd = "TND"
        case wst = "WST"
        case currenciesTRY = "TRY"
        case aed = "AED"
        case bam = "BAM"
        case bwp = "BWP"
        case ggp = "GGP"
        case scr = "SCR"
        case aoa = "AOA"
        case qar = "QAR"
        case nad = "NAD"
        case khr = "KHR"
        case gnf = "GNF"
        case uzs = "UZS"
        case zmw = "ZMW"
        case sos = "SOS"
        case bgn = "BGN"
        case rwf = "RWF"
        case gyd = "GYD"
        case mxn = "MXN"
        case cdf = "CDF"
        case etb = "ETB"
        case mop = "MOP"
        case pkr = "PKR"
        case idr = "IDR"
        case ars = "ARS"
        case ron = "RON"
        case ugx = "UGX"
        case srd = "SRD"
        case mvr = "MVR"
        case fjd = "FJD"
        case ttd = "TTD"
        case top = "TOP"
        case clp = "CLP"
        case sdg = "SDG"
        case lsl = "LSL"
        case fkp = "FKP"
        case mzn = "MZN"
        case tjs = "TJS"
        case kpw = "KPW"
        case rsd = "RSD"
        case hnl = "HNL"
        case kes = "KES"
        case byn = "BYN"
        case dop = "DOP"
        case sar = "SAR"
        case bdt = "BDT"
        case bbd = "BBD"
        case imp = "IMP"
        case kzt = "KZT"
        case lyd = "LYD"
        case kyd = "KYD"
        case ngn = "NGN"
        case hrk = "HRK"
        case huf = "HUF"
        case tmt = "TMT"
    }
}


