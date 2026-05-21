//
//  MOICAErrors.swift
//  OpenACExampleApp
//

import Foundation

private let moicaErrorCodes: [String] = [
  "DB_CONN_ERR",
  "DB_SQL_EXP",
  "DB_ROOLBACK",
  "DB_CLOSE_ERR",
  "DB_JNDI_ERR",
  "UNDEFINED",
  "NFCNONCE_INS_ERR",
  "OTP_INS_ERR",
  "NFCNONCE_DBSQL",
  "NFCNONCE_DEL_ERR",
  "SPTKT_DEL_ERR",
  "USERPROF_UPD_ERR",
  "DEVPROF_UPD_ERR",
  "OTP_EXPIRED",
  "OTP_IDNUM_MISMATCH",
  "IDNUM_DEVPROF_NF",
  "IDNUM_DEVPROF_DBSQL",
  "DEV_LIM_REACHED",
  "DEVID_DEVPROF_NF",
  "DEVID_DEVPROF_DBSQL",
  "DEV_DESC_MISMATCH",
  "IDNUM_DEVID_MISMATCH",
  "CERT_SIGNDATA_MISMATCH",
  "CERT_SIGNDATA_ERR",
  "SPTKT_OVD",
  "SPTKTID_SPTKT_NF",
  "SPTKTID_SPTKT_RDM",
  "SPTKTID_TXNLOG_NF",
  "SPTKT_PLD_FT_ERR",
  "SPTKT_DIG_FT_ERR",
  "INV_SP_CHECKSUM",
  "TGT_INV",
  "PM_IDN_FT_ERR",
  "SIGNDATA_LEN_LIMIT",
  "SPTKT_TIME_FT_ERR",
  "SPTKT_TIME_ORV",
  "PS_JSON_MISS_KEY",
  "PS_CONNECT_IOEXC",
  "PS_1001",
  "PS_5000",
  "PS_FCM_UNKNOWN",
  "PS_FCM_ABORTED",
  "PS_FCM_ALREADY_EXISTS",
  "PS_FCM_CANCELLED",
  "PS_FCM_CONFLICT",
  "PS_FCM_DATA_LOSS",
  "PS_FCM_UNAUTHENTICATED",
  "PS_FCM_UNAVAILABLE",
]

/// Returns a user-friendly message for a MOICA error_message string.
/// Tries an exact code match first (text before ":"), then falls back to
/// substring scan so codes embedded anywhere in the message are still caught.
func moicaUserMessage(from errMsg: String) -> String? {
  let code =
    errMsg.components(separatedBy: ":")
    .first?
    .trimmingCharacters(in: .whitespaces) ?? ""
  if !code.isEmpty, moicaErrorCodes.contains(code) {
    return L10n.tr("moica.\(code)")
  }
  for key in moicaErrorCodes where errMsg.contains(key) {
    return L10n.tr("moica.\(key)")
  }
  return nil
}
