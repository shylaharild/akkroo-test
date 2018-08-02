######################
#
# AWS site.pp file
#
######################

node default {
}

node /^website01*/ {
  include website
}

node /^website02*/ {
  include website
}
