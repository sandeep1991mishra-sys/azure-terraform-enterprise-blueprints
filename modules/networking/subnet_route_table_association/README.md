#Features
#
#Associate multiple subnets with Route Tables.
#
#Use existing subnet and Route Table resource IDs.
#
#Export association IDs, subnet IDs, and Route Table IDs.
#
#Keep subnet association logic separate from resource creation.


#Important Considerations
#
#The subnet and Route Table must already exist.
#
#Each subnet can be associated with only one Route Table at a time.
#
#Changing the association may affect traffic routing for the subnet.
#
#Ensure the Route Table contains appropriate routes before applying it to production workloads.