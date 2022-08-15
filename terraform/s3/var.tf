variable "bucket_name" {
  description = "Name of raw data bucket"
}
variable "encrypt" {
  type        = string
  default     = "AES256"
  description = "Crypto"
}
variable "named_folder"{
  type        = string
  default     = "raw_statistics_reference_data"
  description = "Name of json folder"
}
variable "base_folder"{
  type        = string
  default     = "youtube"
  description = "Base folder of data project"
}
variable "data_path" {
  type        = string
  default     = "/home/atilla/data"
  description = "Path of the data on my PC"
}

variable "regions" {
  default = {
    CA = "\\region=CA"
    DE = "\\region=DE"
    FR = "\\region=FR"
    GB = "\\region=GB"
    IN = "\\region=IN"
    JP = "\\region=JP"
    KR = "\\region=KR"
    MX = "\\region=MX"
    RU = "\\region=RU"
    US = "\\region=US"
  }
}





