export RR=/usr/local/var/root_service
rsv()
{
  SVDIR=RR sv $1 $RR/$2
}