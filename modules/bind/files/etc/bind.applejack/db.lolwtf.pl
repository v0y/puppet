$TTL 1800s
$ORIGIN lolwtf.pl.

@  IN  SOA NS1.DIGITALOCEAN.COM.  hostmaster.lolwtf.pl. (
  2014052600  ; serial
  3600        ; refreshs
  900         ; refresh update retry
  1209600     ; when master dies.. after this time slave goes away..
  1800        ; the time a name error = nx domain may be cached by any resolver
)

@  IN  NS  NS1.DIGITALOCEAN.COM.
@  IN  NS  NS2.DIGITALOCEAN.COM.
@  IN  NS  NS3.DIGITALOCEAN.COM.

@  300 IN  A 188.226.222.101
@  300 IN TXT "zoho-verification=zmverify.zoho.com"

*  188.226.222.101
