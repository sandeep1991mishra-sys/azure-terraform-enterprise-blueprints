#Important Considerations
#
#The target Route Table must already exist.
#
#This module creates routes only; it does not create Route Tables or associate them with subnets.
#
#VirtualAppliance requires a valid next-hop IP address.
#
#Ensure that route prefixes and next-hop settings are valid for the intended network design.
#
#Review custom routes carefully because incorrect routing can interrupt network connectivity.
#
#Related Modules
#
#route-table — creates Azure Route Tables.
#
#subnet-route-table-association — associates Route Tables with subnets.