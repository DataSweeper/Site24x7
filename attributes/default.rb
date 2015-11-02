#api key attribute
default[:Site24x7][:APIkey] = ""
default[:default][:proxy] = ""

#package identification
if node["kernel"]["machine"] == "i686" || node["kernel"]["machine"] == "i386"
  default[:package] = "Site24x7_Linux_32bit.install"
else
   default[:package] = "Site24x7_Linux_64bit.install"
end

