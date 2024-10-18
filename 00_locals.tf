locals {
  #   login = "<your_login>"
  login                = "tomasz.m"
  sufix                = replace(local.login, ".", "")
  location             = "northeurope"
  test_user_login      = "${local.login}.test@grumpykoaliongmailcom.onmicrosoft.com"
  containers           = [local.sufix]
  storage_account_name = "adloperationsqnoryh"
}
