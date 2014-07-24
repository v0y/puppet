$TTL 1800s
$ORIGIN lolwtf.pl.

@  IN  SOA NS1.DIGITALOCEAN.COM.  hostmaster.lolwtf.pl. (
  1406236964  ; last update: 2014-07-24 21:22:43 UTC
  3600        ; refreshs
  900         ; refresh update retry
  1209600     ; when master dies.. after this time slave goes away..
  1800        ; the time a name error = nx domain may be cached by any resolver
)

@  IN  NS  NS1.DIGITALOCEAN.COM.
@  IN  NS  NS2.DIGITALOCEAN.COM.
@  IN  NS  NS3.DIGITALOCEAN.COM.

MX 10 mx.zohomail.com.
MX 20 mx2.zohomail.com.

@  300 IN  A 188.226.222.101
@  300 IN TXT "v=spf1 a:lolwtf.pl ~all"

*  188.226.222.101
